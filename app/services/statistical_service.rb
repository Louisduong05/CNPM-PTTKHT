class StatisticalService
  class << self
    def call(to_date, from_date, type)
      products = ::Product.includes(:exported_items, :imported_items).all
      result =
        if type == 'Import'
          imports(to_date, from_date, products)
        else
          exports(to_date, from_date, products)
        end
      {
        result: result
      }
    end

    private

    def exports(to_date, from_date, products)
      data = []
      products.each  do |product|
        next if product.exported_items.blank?

        exported_items = compare_date(to_date, from_date, product.exported_items)
        data << format_data_export(exported_items, product) if exported_items.present?
      end
      data
    end

    def imports(to_date, from_date, products)
      data = []
      products.each  do |product|
        next if product.imported_items.blank?

        imported_items = compare_date(to_date, from_date, product.imported_items)
        data << format_data_import(imported_items, product) if imported_items.present?
      end
      data
    end

    def format_data_import(imported_items, product)
      {
        product_id: "PRODUCT / #{product.id}",
        product_name: product.name,
        total_quantity: total_quantity(imported_items),
        price_range_max: imported_items.map(&:unit_price).max,
        price_range_min: imported_items.map(&:unit_price).min,
        from: imported_items.map(&:created_at).min.try(:strftime, ('%d/%m/%Y')),
        to: imported_items.map(&:created_at).max.try(:strftime, ('%d/%m/%Y')),
        details: details_imported_items(imported_items)
      }
    end

    def format_data_export(exported_items, product)
      {
        product_id: "PRODUCT / #{product.id}",
        product_name: product.name,
        total_quantity: total_quantity(exported_items),
        price_range_max: exported_items.map(&:unit_price).max,
        price_range_min: exported_items.map(&:unit_price).min,
        from: exported_items.map(&:created_at).min.try(:strftime, ('%d/%m/%Y')),
        to: exported_items.map(&:created_at).max.try(:strftime, ('%d/%m/%Y')),
        details: details_exported_items(exported_items)
      }
    end

    def compare_date(to_date, from_date, items)
      items.select do |item|
        case [to_date.present?, from_date.present?]
        when [false, true]
          item.created_at >= item.to_date.beginning_of_day
        when [true, true]
          item.created_at >= from_date.to_date.beginning_of_day &&
          item.created_at <= to_date.to_date.end_of_day
        when [true, false]
          item.created_at <= to_date.to_date.end_of_day
        else
          item
        end
      end
    end

    def total_quantity(items)
      total = 0
      items.each do |item|
        total += item.quantity
      end
      total
    end

    def details_imported_items(imported_items)
      details = []
      imported_items.each do |imported_item|
        details << {
          imported_id: "IMPORT / #{imported_item.import.id}",
          user: imported_item.import.user.name,
          user_id: imported_item.import.user.id,
          quantity: imported_item.quantity,
          unit_price: imported_item.unit_price, 
          created_at: imported_item.created_at.strftime('%d/%m/%Y')
        }
      end
      details
    end
    def details_exported_items(exported_items)
      details = []
      exported_items.each do |exported_item|
        details << {
          imported_id: "EXPORT / #{exported_item.export.id}",
          user: exported_item.export.user.name,
          user_id: exported_item.export.user.id,
          quantity: exported_item.quantity,
          unit_price: exported_item.unit_price, 
          created_at: exported_item.created_at.strftime('%d/%m/%Y')
        }
      end
      details
    end
  end
end
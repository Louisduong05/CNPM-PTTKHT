class StatisticalService
  class << self
    def call(to_date, from_date)
      {
        suppliers: suppliers(to_date, from_date),
        customers: customers(to_date, from_date)
      }
    end

    private

    def suppliers(to_date, from_date)
      data = []
      suppliers = Supplier.all
      suppliers.includes(:imports, :imported_items).each do |supplier|
        import_ids = supplier.imports
                .where("created_at::date >= ? and created_at::date <= ?", from_date, to_date)
                .pluck(:id)
        if import_ids.count > 0
          imported_items = supplier.imported_items.where(import_id: import_ids, status: 'Done')
          if imported_items.present?
            data << {
              supplier_id: supplier.id,
              supplier_name: supplier.name,
              imported_items: data_import_items(imported_items)
            }
          end
        end
      end
      data
    end

    def customers(to_date, from_date)
      data = []
      customers = Customer.all
      customers.includes(exports: [:exported_items]).each do |customer|
        export_ids = customer.exports
                .where("created_at::date >= ? and created_at::date <= ?", from_date, to_date)
                .pluck(:id)
        if export_ids.count > 0
          exported_items = customer.exported_items.where(export_id: export_ids)
          if exported_items.present?
            data << {
              customer_id: customer.id,
              customer_name: customer.name,
              exported_items: data_export_items(exported_items)
            }
          end
        end
      end
      data
    end

    def data_import_items(imported_items)
      data = []
      imported_item_ids = imported_items.pluck(:id)
      product_ids = imported_items.pluck(:product_id)
      products = Product.where(id: product_ids)
      products.includes(:imported_items).each do |product|
        quantity_products = 0
        total = 0
        product.imported_items.where(id: imported_item_ids).each do |imported_item|
          quantity_products = quantity_products + imported_item.quantity
          total = total + imported_item.quantity*imported_item.unit_price
        end
        data << {
          product_name: product.name,
          quantity: quantity_products,
          total: total
        }
      end
      data
    end

     def data_export_items(exported_items)
      data = []
      exported_item_ids = exported_items.pluck(:id)
      product_ids = exported_items.pluck(:product_id)
      products = Product.where(id: product_ids)
      products.includes(:exported_items).each do |product|
        quantity_products = 0
        total = 0
        product.exported_items.where(id: exported_item_ids).each do |exported_item|
          quantity_products = quantity_products + exported_item.quantity
          total = total + exported_item.quantity*exported_item.unit_price
        end
        data << {
          product_name: product.name,
          quantity: quantity_products,
          total: total
        }
      end
      data
    end
  end
end
class SupplierFilter
  include ActiveModel::Model
  attr_accessor :keyword

  def initialize(suppliers, attributes)
    @suppliers = suppliers
    @keyword = attributes[:keyword]
  end

  def result
    @suppliers = @suppliers.where(" suppliers.name ILIKE :keyword", keyword: "%#{keyword}%") if keyword.present?

    @suppliers
  end

  def persisted?
    false
  end


end
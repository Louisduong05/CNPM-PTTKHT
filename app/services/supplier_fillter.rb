class SupplierFillter
  include ActiveModel::Model
  attr_accessor :keyword

  def initialize(suppliers, attributes = {})
    @suppliers = suppliers
    attributes.each {|name, value| send("#{name}", value)
  end

  def result
    @suppliers = @suppliers.where("suppliers.name ILIKE :keyword", keyword: "%#{keyword}%") if keyword.present?
    
  end
end
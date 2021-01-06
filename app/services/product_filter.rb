class ProductFilter
  include ActiveModel::Model
  attr_accessor :keyword

  def initialize(products, attributes = {})
    @products = products
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @products = @products.where("products.name ILIKE :keyword", keyword: "%#{keyword}%") if keyword.present?

    @products
  end
end
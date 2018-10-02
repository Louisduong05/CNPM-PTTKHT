class CustomerFilter
  include ActiveModel::Model
  attr_accessor :keyword

  def initialize(customers, attributes = {})
    @customers = customers
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
     @customers = @customers.where(" customers.name ILIKE :keyword", keyword: "%#{keyword}%") if keyword.present?

    @customers
  end

  def persisted?
    false
  end


end
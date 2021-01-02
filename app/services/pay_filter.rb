class PayFilter
  include ActiveModel::Model
  attr_accessor :status

  def initialize(pays, attributes = {})
    @pays = pays
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @pays = @pays.where(status: status) if status.present?
    @pays
  end
end
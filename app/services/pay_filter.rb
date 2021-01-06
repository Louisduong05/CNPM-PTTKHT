class PayFilter
  include ActiveModel::Model
  attr_accessor :user_id, :status, :type, :code, :from, :to

  def initialize(pays, attributes = {})
    @pays = pays
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @pays = @pays.where(status: status) if status.present?
    @pays = @pays.where(user_id: user_id) if user_id.present?
    @pays = @pays.where(pay_type_type: type) if type.present?
    @pays = @pays.where(code: code) if code.present?
    @pays = @pays.where(
      ["created_at >= ?", from.to_date.beginning_of_day]
    ) if from.present?
    @pays = @pays.where(
      ["created_at <= ?", to.to_date.end_of_day]
    ) if to.present?
    @pays
  end
end
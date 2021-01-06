class ExportFilter
  include ActiveModel::Model
  attr_accessor :user_id, :status, :from, :to

  def initialize(exports, attributes = {})
    @exports = exports.includes(:pay)
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @exports = @exports.where(user_id: user_id) if user_id.present?
    @exports = @exports.where(pays: { status: status }) if status.present?
    @imports = @exports.where(
      ["created_at >= ?", from.to_date.beginning_of_day]
    ) if from.present?
    @imports = @exports.where(
      ["created_at <= ?", to.to_date.end_of_day]
    ) if to.present?
    @exports
  end

  def persisted?
    false
  end

end
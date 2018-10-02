class ExportFilter
  include ActiveModel::Model
  attr_accessor :user_id

  def initialize(exports, attributes = {})
    @exports = exports
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @exports = @exports.where(user_id: user_id) if user_id.present?

    @exports
  end

  def persisted?
    false
  end

end
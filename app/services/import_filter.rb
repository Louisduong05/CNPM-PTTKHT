class ImportFilter
  include ActiveModel::Model
  attr_accessor :user_id, :status, :from, :to

  def initialize(imports, attributes = {})
    @imports = imports
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @imports = @imports.where(user_id: user_id) if user_id.present?
    @imports = @imports.where(status: status) if status.present?
    @imports = @imports.where(
      ["created_at >= ?", from.to_date.beginning_of_day]
    ) if from.present?
    @imports = @imports.where(
      ["created_at <= ?", to.to_date.end_of_day]
    ) if to.present?

    @imports
  end
end
class ImportFilter
  include ActiveModel::Model
  attr_accessor :user_id

  def initialize(imports, attributes = {})
    @imports = imports
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def result
    @imports = @imports.where(user_id: user_id) if user_id.present?

    @imports
  end

  def persisted?
    false
  end

end
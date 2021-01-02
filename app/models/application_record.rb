class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.translate_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def self.translate_enum_collection(enum_name)
    data = self.send(enum_name.to_s.pluralize)
    data.keys.map do |enum_value|
      [self.translate_enum_name(enum_name, enum_value), data[enum_value]]
    end
  end
end

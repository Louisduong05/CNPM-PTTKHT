require_relative 'boot'

require 'rails/all'

require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'sprockets/es6'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CNPMPttkht
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    locale_files = Dir["#{Rails.root}/config/locales/??.yml"]

    config.i18n.available_locales = locale_files.map do |d| 
      d.split('/').last.split('.').first
    end
    
    config.i18n.default_locale = :vi

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

require 'selenium-webdriver'

if ENV["SLOW"].present?
  module ::Selenium::WebDriver::Remote
    class Bridge
      alias old_execute execute

      def execute(*args)
        sleep(ENV["SLOW"].to_f/10)
        old_execute(*args)
      end
    end
  end
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.default_max_wait_time = 1 # seconds
  config.default_driver        = :selenium
end
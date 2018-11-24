require 'selenium-webdriver'

if ENV["SLOW"].present?
  require "selenium-webdriver"
  module ::Selenium::WebDriver::Remote
    class Bridge
      alias old_execute execute

      def execute(*args)
        sleep(0.1)
        old_execute(*args)
      end
    end
  end
end

Capybara.current_driver = :selenium_chrome 
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, 
    browser: :chrome,
    fullscreen_window: true
  )
end
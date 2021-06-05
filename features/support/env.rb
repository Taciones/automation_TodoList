require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"
require "report_builder"
require "rspec"
require "pry"


ELEMENTS = YAML.load_file("features/support/data/page_elements/elements.yml")

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
    @driver = :selenium_headless
else
    puts "Invalid Browser"
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 10
end
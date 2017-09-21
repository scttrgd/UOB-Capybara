require 'capybara-screenshot/cucumber'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require_relative '../../../cyfrinair.rb'
require 'capybara/poltergeist'
require 'appium_capybara'
require 'appium_lib'
require 'sauce_whisk'
require 'yaml'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))
# @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

# puts CONFIG['common_caps']
# puts CONFIG['browser_caps']

# Setting up the javascript driver, since selenium doesn't always support javascript
Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
# Capybara.default_driver = :selenium

# This is for remote selenium operation
Capybara.run_server = false
Capybara.default_max_wait_time = 10
Capybara.default_driver = :BUCSerStack

Capybara.register_driver :BUCSerStack do | app|
  url = "http://138.38.100.48:4444/wd/hub"

  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote, :url => url,
                                 :desired_capabilities => :firefox
                                 )
end

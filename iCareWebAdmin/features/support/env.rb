require 'capybara-screenshot/cucumber'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require_relative '../../../cyfrinair.rb'
require 'capybara/poltergeist'
require 'appium_capybara'
require 'appium_lib'
require 'sauce_whisk'


# Setting up the javascript driver, since selenium doesn't always support javascript
Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
# Capybara.default_driver = :selenium

# This is for remote selenium operation
Capybara.run_server = true
Capybara.default_max_wait_time = 10
Capybara.default_driver = :selenium

# Capybara.register_driver :selenium do | app|
#   url = "http://138.38.100.48:4444/wd/hub"
#
#   Capybara::Selenium::Driver.new(app,
#                                  :browser => :remote, :url => url,
#                                  :desired_capabilities => :firefox)
# end

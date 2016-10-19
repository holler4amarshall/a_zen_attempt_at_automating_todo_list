require 'rspec'
require 'page-object'
#require_relative '/../../pages/todo_list.rb'

#selenium_driver = Selenium::WebDriver.for :firefox

DEFAULT_TIMEOUT = 10

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT






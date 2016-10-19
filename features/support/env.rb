require 'rspec'
require 'page-object'
require 'selenium-webdriver'
#require 'pretty_face'

DEFAULT_TIMEOUT = 10

driver = Selenium::WebDriver.for :chrome
$driver = driver
$driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT






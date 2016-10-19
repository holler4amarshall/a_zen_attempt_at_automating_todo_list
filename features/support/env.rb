require 'rspec'
require 'page-object'
require 'selenium-webdriver'
#require 'pretty_face'

DEFAULT_TIMEOUT = 10
BROWSER = :chrome

driver = Selenium::WebDriver.for BROWSER
$driver = driver
$driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT






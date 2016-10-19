
Before do |scenario|
    @browser = Browser.new(ENV['DRIVER'])
end

After do |scenario|
    @browser.driver.quit
end
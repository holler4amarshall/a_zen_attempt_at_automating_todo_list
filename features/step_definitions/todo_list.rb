require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/todo_list'

DEFAULT_TIMEOUT = 2

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT


### Step definitions ###




Given(/^I open the todo list application$/) do
  driver.navigate.to "http://todomvc.com/examples/emberjs/index.html"
  #open_todo_list
end

Given(/^I see todo list application$/) do
  driver.find_element(:xpath, ("//h1[text()='todos']")) 
end

Given(/^My todo list is empty$/) do
  except driver.find_element(:xpath, "//ul[@id='todo-list']").exists? rescue false
end

When(/^I add "([^"]*)" to my list$/) do |item|
  driver.find_element(:id, "new-todo").send_keys(item + "\n")
end

Then(/^I see "([^"]*)" in my list$/) do |item|
  driver.find_element(:xpath, "//ul[@id='todo-list']/*//label[text()='#{item}']")
end

Given(/^I see "([^"]*)" is not completed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I mark "([^"]*)" as completed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see "([^"]*)" is completed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I mark "([^"]*)" as incomplete$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I see "([^"]*)" item in my todo list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see "([^"]*)" items in my todo list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I mark all todo items as completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see all todo items as completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Some items in my list are completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I filter items using completed filter$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see the completed items$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I tap on the delete button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I no longer see "([^"]*)" in my list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click Clear Completed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/todo_list'

#DEFAULT_TIMEOUT = 2

#driver = Selenium::WebDriver.for :chrome
#driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT

### Step definitions ###

active = 'ember-view' #status
completed = 'ember-view completed' #status


Given(/^I open the todo list application$/) do
  Todo.open_todo_list
end

Given(/^I see todo list application$/) do
  Todo.heading_displayed 
end

Given(/^My todo list is empty$/) do
  Todo.list_is_empty
end

When(/^I add "([^"]*)" to my list$/) do |item|
  Todo.add_item(item)
end

Then(/^I see "([^"]*)" in my list$/) do |item|
  Todo.item_appears_in_list(item)
end

Given(/^I see "([^"]*)" is not completed$/) do |item|
  status = Todo.get_completion_status(item)
  fail "#{item} is complete" unless status == active 
end

Then(/^I see "([^"]*)" is completed$/) do |item|
  
end

When(/^I mark "([^"]*)" (?:is|as) (?:completed|active)$/) do |item|
  Todo.change_status(item)
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

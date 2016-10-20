require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/todo_list'

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
  status = Todo.get_completion_status(item)
  fail "#{item} is complete" unless status == completed
end

When(/^I mark "([^"]*)" (?:is|as) (?:completed|active)$/) do |item|
  Todo.change_status(item)
end

Given(/^I see "([^"]*)" items? in my todo list$/) do |number|
  num_items = Todo.get_list_count
  num_items = num_items.to_s
  fail "total of #{num_items} does not match expected: #{number}." unless num_items == number.to_s
end

When(/^I mark all todo items as completed$/) do
  Todo.mark_all_complete
end

Then(/^I see all todo items as completed$/) do 
  status = Todo.check_all_items_status
  fail "some items are not complete" unless status.include?(completed)
end

Given(/^Some items in my list are completed$/) do
  status = Todo.check_all_items_status
  fail "at least one item is not complete" unless status.include?(completed)
end

When (/^I filter items by "([^"]*)"$/) do |filter|
  Todo.filter_by(filter)
end

Then(/^I see the completed items$/) do
  status = Todo.check_all_items_status
  fail "some items displayed are not complete" unless status.include?(completed)
end

When(/^I click x to delete "([^"]*)"$/) do |item|
  Todo.clear_item(item)
end

Then(/^I no longer see "([^"]*)" in my list$/) do |item|
  Todo.item_not_displayed(item)
end

When(/^I click Clear Completed$/) do
  Todo.click_clear_completed
end

Then(/^I can edit the item from "([^"]*)" to "([^"]*)"$/) do |old_item, new_item|
  Todo.edit_item(old_item, new_item)
end



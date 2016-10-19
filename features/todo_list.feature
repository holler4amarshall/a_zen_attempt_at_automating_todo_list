Feature: to do list
	As a to do list user
	I want to manage my to do list
	So I can manage my daily tasks

@wip
Scenario: background
	Given I open the todo list application
	And I see todo list application


Scenario: Add an item to the to do list
	Given My todo list is empty
	When I add "walk the dog" to my list
	Then I see "walk the dog" in my list
@not_ready
Scenario: Complete item in the to do list
	Given I see "walk the dog" in my list
	And I see "walk the dog" is not completed
	When I mark "walk the dog" as completed
	Then I see "walk the dog" is completed

Scenario: Undo complete item in the to do list
	Given I see "walk the dog" is completed
	When I mark "walk the dog" as incomplete
	Then I see "walk the dog" is not completed

Scenario: Add a second to do list item
	Given I see "1" item in my todo list
	When I add "feed the dog" to my list
	Then I see "feed the dog" in my list
	And I see "2" items in my todo list

Scenario: Complete all items using the down arrow at top left of UI
	Given I see "2" items in my todo list
	When I mark all todo items as completed
	Then I see all todo items as completed

Scenario: View all completed items using Completed filter
	Given Some items in my list are completed
	When I filter items using completed filter
	Then I see the completed items

Scenario: Clear an item from the list
	Given I see "walk the dog" in my list
	When I tap on the delete button
	Then I no longer see "walk the dog" in my list

Scenario: Clear all completed Todo items from the list
	Given Some items in my list are completed
	When I click Clear Completed 
	Then My todo list is empty
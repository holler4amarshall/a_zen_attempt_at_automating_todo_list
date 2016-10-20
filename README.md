#update
on 20/10, I ran the tests in multiple browsers and found that there were some cross browser issues running the tests. 
the test suite is currently written against Chrome browser & there will be failures (that aren't handled gracefully in the other browsers, such as Safari) 

additionally, I noticed that I skipped out the test for Edit item.

when I added this test in, I noticed that there is a bug? in the application when running in Chrome browser: 

after an item is edited, the new value appears on the screen after the item has been edited. 

chrome issue: *however, once the URL is refreshed, the item displays the old text.* 

As a last minute resort: I updated the test flow, to incorporate the expected result of this bug. 

Eg, Safari is not accepting the send keys (enter) command, and changes to the tests would need to ensure that tests dont fail in Safari. 

# a_zen_attempt_at_automating_todo_list
a cucumber, selenium web driver, ruby test demo

a_zen_attempt_at_automating_todo_list

a cucumber, selenium web driver, ruby test demo

#Demo test project

This is a quick demo of an automated test framework with selenium webdriver, ruby & cucumber/gherkin. 

The project is based on an ember.js todo list application

##Run the tests

Pre-requisites:

* Clone test repository to your computer 
* Ruby, Cucumber, Selenium-WebDriver, ChromeDriver, Page-Objects are installed

###Run the tests

In the root folder of your local copy of the test project, execute the command "cucumber" >> See the test results displayed in the terminal >> See that test results are updated in the report.html file

##Test Reports

The last successful run report has been uploaded on GitHub and is available at: /report.html, to view in your browser of choice. 

##Test scenarios

The test cases within attempt to cover: 
* I want to add a Todo item 
* I want to edit the content of an existing Todo item 
* I can complete a Todo by clicking inside the circle UI to the left of the Todo 
* I can re-activate a completed Todo by clicking inside the circle UI 
* I can add a second Todo 
* I can complete all active Todos by clicking the down arrow at the top-left of the UI 
* I can filter the visible Todos by Completed state 
* I can clear a single Todo item from the list completely by clicking the Close icon 
* I can clear all completed Todo items from the list completely

##Issues to address

* Verify element does not exist steps (x2) require further work to ensure that they are more reliable
* The test specifications asked to begin tests at the http://todomvc.com/ page, and to navigate to the javascript todo app via the link. When testing this manually, the link redirects to another URL. This step was ommitted in the automation script. 
* Reporting could be improved by returning more detailed errors from the scripts, especially if any steps become flakey
* Better before and after steps could be implemented to ensure suite does not fall over if errors exist in one scenario
* The code could be refactored to reduce duplication, get better regex, create single source for locating the elements that are referenced multiple times, etc. 

##Executing tests on multiple browsers

* The test suite could be integrated with selenium grid in order to execute tests across multiple browsers efficiently. The configuration details are specified here: https://github.com/SeleniumHQ/selenium/wiki/Grid2
* Alternatively, services such as SauceLabs could be used in order to execute tests concurrently on multiple platforms/browsers in the cloud. This service is licensed for a fee.
* With further configuration, it is possible to specify the browser as part of the cucumber command at run time. This can be done when manually initiating the automated tests, or via the Continuous Integration tool such as Jenkins. This is a third approach to cross browser execution.



module Todo

	class << self

		include PageObject


		def open_todo_list
			$driver.navigate.to "http://todomvc.com/examples/emberjs/index.html"
		end


		def heading_displayed
			$driver.find_element(:xpath, "//h1[text()='todos']")
		end


		def list_is_empty
			$driver.find_element(:xpath, "//ul[@id='todo-list']").exists? rescue false
			#this step needs fixing
		end


		def add_item(item)
  			$driver.find_element(:id, "new-todo").send_keys(item + "\n")
  		end


		def item_appears_in_list(item)
			$driver.find_element(:xpath, "//ul[@id='todo-list']/*//label[text()='#{item}']")
		end


		def locate_item_by_text(text)
			label = $driver.find_element(:xpath, "//label[text()='#{text}']")
		end


		def get_item_from_text(text)
			item = locate_item_by_text(text)
			parent = item.find_element(:xpath, "../..")
		end


		def get_completion_status(text)
			parent = get_item_from_text(text)
			completion_status = parent.attribute('class')
  		end

		def get_item_id(text)
			parent = get_item_from_text(text)
			item_id = parent.attribute('id')
			return item_id
  		end  		


  		def change_status(text)
  			parent = get_item_from_text(text)
  			parent_id = parent.attribute('id')
  			$driver.find_element(:xpath, "//li[@id='#{parent_id}']/*//input[@type='checkbox']").click
  		end

  		def mark_all_complete
			$driver.find_element(:id, ('toggle-all')).click
		end


		def click_clear_completed
			$driver.find_element(:xpath, "//button[text()='Clear completed']").click
		end


		def mark_all_clear
			$driver.find_element(:id, ('toggle-all')).click
		end


		def clear_item(text)
			item = get_item_from_text(text)
			parent = get_item_from_text(text)
  			parent_id = parent.attribute('id')
  			$driver.mouse.move_to item
			$driver.find_element(:xpath, ("//li[@id='#{parent_id}']/*//button")).click
		end

		def item_not_displayed(text)
			result = locate_item_by_text(text)
			puts result
			fail "#{text} is still displayed" unless result == true 
			rescue Selenium::WebDriver::Error::NoSuchElementError
			#this step needs fixing
		end

  		def get_list_count
			items = []
			items = $driver.find_elements(:xpath, "//ul[@id='todo-list']/li")
			num_items = items.count
			num_items = num_items.to_s
			puts "total items = " + num_items.to_s
			return num_items
		end

		def check_total_items
			total_field = $driver.find_element(:xpath, ("//span[@id='todo-count']/strong"))
			total = total_field.attribute('value')
		end

		def check_all_items_status
			items = []
			status = []
			items = $driver.find_elements(:xpath, "//li[contains(@id, 'ember')]") #put all items in a list
			puts items
			for item in items do
				item_status = item.attribute('class')
				puts item_status
				status.push(item_status)
			end
			puts status
			return status
		end

		def filter_by(filter)
			$driver.find_element(:link_text, ("#{filter}")).click
		end

		
		def edit_item(old_item, new_item)
			item = get_item_from_text(old_item)
			parent = get_item_from_text(old_item)
  			parent_id = parent.attribute('id')
  			$driver.action.double_click(item).perform
  			sleep  1
  			#edit_field = $driver.find_element(:xpath, "//li[@id='#{parent_id}']/*//input[@class='edit']/label[text()='#{old_item}']")
  			edit_field = $driver.find_element(:xpath, "//input[@class='edit']")
  			edit_field.clear
  			edit_field.send_keys(new_item)
  			sleep  1
  			edit_field.send_keys("\n")
  			sleep 1
  			$driver.find_element(:xpath, "//li[@id='#{parent_id}']/*//label[text()='#{new_item}']")
		end

	end

end
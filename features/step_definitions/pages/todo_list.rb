
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
		end


		def add_item(item)
  			$driver.find_element(:id, "new-todo").send_keys(item + "\n")
  		end


		def item_status(item, status)
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


  		def change_status(text)
  			parent = get_item_from_text(text)
  			parent_id = parent.attribute('id')
  			$driver.find_element(:xpath, "//li[@id='#{parent_id}']/*//input[@type='checkbox']").click
  		end

  		def mark_all_complete
			$driver.find_element(:id, ('toggle-all')).click
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
			status = []
			status = $driver.find_elements(:xpath, "//ul").attribute('class') #put all status in a list
			puts status
			return status
		end

		

	end

end
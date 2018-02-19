#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require './driver.rb'

class Iterate
	#Performs an iteration of the program
	def iterate(number, the_locs, the_vias)
		#Setup for single driver
		old_loc = the_locs.locations[Random.rand(0..3)]
		new_driver = Driver.new(number, old_loc)
		continue = true
		#Loop until driver leaves town
		while(continue)
			#Randomly select next location from possible
			new_loc = old_loc.nodes[Random.rand(0..1)]
			#Find road
			via = the_vias.find_via(old_loc.name, new_loc.name)
			#Output to console
			puts ("Driver #{new_driver.number} heading from #{old_loc.name} to #{new_loc.name} via #{via.name}")
			#Set Driver Location
			new_driver.location = new_loc.name
			#Update Driver
			new_driver.update()
			new_driver.output()
			#Set new to old location
			old_loc = new_loc
			#Check if leaving town
			continue = check_leaving(new_driver.location)
		end
	end

	def check_leaving(location)
		if (location == "Downtown" || location == "Monroeville")
			return false
		else
			return true
		end
	end

	def check_seed(arg)
		if arg.is_a?(Integer)
			return arg.to_i
		else
			return 0
		end
	end
end
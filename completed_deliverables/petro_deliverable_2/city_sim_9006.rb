#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require './locations.rb'
require './roads.rb'
require './iteration.rb'

#Create city and iterator for drivers
city_locations = Locations.new()
city_roads = Roads.new()
iter_ator = Iterate.new()
puts("----Start----")

#Loops through 5 drivers
(1..5).each do |i|
	iter_ator.iterate(i, city_locations, city_roads)
	#Nice separator between drivers
	puts("--------")
end


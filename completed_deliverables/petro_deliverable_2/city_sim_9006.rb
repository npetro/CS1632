#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require './locations.rb'
require './roads.rb'
require './iteration.rb'

# ARGUMENT HANDLING
raise "Please enter a seed (and only one) at command line in order to run the program." unless ARGV.count == 1

# EXECUTION BEGINS
#Create city and iterator for drivers
city_locations = Locations.new()
city_roads = Roads.new()
iter_ator = Iterate.new()
seed = iter_ator.check_seed(ARGV[0])
Random.srand(seed)

puts("--------")

#Loops through 5 drivers
(1..5).each do |i|
	iter_ator.iterate(i, city_locations, city_roads)
	#Nice separator between drivers
	puts("--------")
end

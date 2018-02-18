#Nick Petro - CS1632 Spring 2018 - Deliverable 2
class Road
	#Creates a new road
	attr_accessor :name
	attr_accessor :locations

	def initialize(name)
		@name = name
		@locations = []
	end
end
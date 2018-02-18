#Nick Petro - CS1632 Spring 2018 - Deliverable 2
class Location
	#Creates a new location
	attr_accessor :name
	attr_accessor :nodes

	def initialize(name)
		@name = name
		@nodes = []
	end
end
#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require './location.rb'

class Locations
	attr_accessor :locations
	def initialize
		#Create Locations
		dt = Location.new("Downtown")
		ho = Location.new("Hospital")
		hi = Location.new("Hillman")
		ca = Location.new("Cathedral")
		mu = Location.new("Museum")
		mo = Location.new("Monroeville")
		#Establish Connections
		ho.nodes = [hi,ca]
		hi.nodes = [dt,ho]
		ca.nodes = [mo,mu]
		mu.nodes = [ca,hi]
		#Put in array
		@locations = [ho,hi,ca,mu,mo,dt]
	end
end
#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require './road.rb'

class Roads
	attr_accessor :roads
	def initialize
		#Create Roads
		@fourth = Road.new("Fourth Ave.")
		@bar = Road.new("Bar St.")
		@foo = Road.new("Foo St.")
		@fifth = Road.new("Fifth Ave.")
		#Establish Connections
		@fourth.locations = ["Hospital","Cathedral","Monroeville"]
		@foo.locations = ["Hospital","Hillman"]
		@bar.locations = ["Cathedral","Museum"]
		@fifth.locations = ["Hillman","Museum","Downtown"]
		#Put in array
		@roads = [@fourth, @foo, @bar, @fifth]
	end
	#Find which road the driver is on
	def find_via(loc1, loc2)
		if(@fourth.locations.include?(loc1) && @fourth.locations.include?(loc2))
			return @fourth
		elsif (@foo.locations.include?(loc1) && @foo.locations.include?(loc2))
			return @foo
		elsif (@bar.locations.include?(loc1) && @bar.locations.include?(loc2))
			return @bar
		elsif (@fifth.locations.include?(loc1) && @fifth.locations.include?(loc2))
			return @fifth
		else
			puts ("Error!! Something has gone horribly wrong and you ripped through the space-time continuum to somewhere you should not be...")
			exit
		end
	end	
end
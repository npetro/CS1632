#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './road.rb'

class TestRoad < Minitest::Test

	def setup
		@road = Road.new("Fifth Ave.")
		@road2 = Road.new("Fourth Ave.")
		@road2.locations = ["Cathedral"]
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# name = new("Name") -> creates road with name "Name"
	# locations = [] -> returns []
	# locations = ["Road_Name"] -> returns [0] = "Road_Name"
	# locations = ["Road_Name"] -> returns count = 1

	# Name passed in is name stored within the object
	def test_name_is_fifth_ave
		assert_equal "Fifth Ave.", @road.name
	end
	
	# If the locations are not set, should be an empty array
	def test_locations_is_empty
		assert_equal [], @road.locations
	end

	# If the locations is set, should be able to access the location
	def test_locations_of_fourth_ave
		assert_equal "Cathedral", @road2.locations[0]
	end

	# If the locations is set, should be able to access the location
	def test_count_locations_of_fourth_ave
		assert_equal 1, @road2.locations.count
	end

	
end
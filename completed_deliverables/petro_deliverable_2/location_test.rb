#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './location.rb'

class TestLocation < Minitest::Test

	def setup
		@location = Location.new("Hillman")
		@location2 = Location.new("Museum")
		@location2.nodes = [@location]
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# name = new("Name") -> creates location with name "Name"
	# nodes = [] -> returns []
	# nodes = [location] -> returns [0] = location
	# # nodes = [location] -> returns [0].name = location.name = "Name"
	# locations = ["Road_Name"] -> returns count = 1

	# Name passed in is name stored within the object
	def test_name_is_hillman
		assert_equal "Hillman", @location.name
	end
	
	# If the nodes are not set, should be an empty array
	def test_nodes_is_empty
		assert_equal [], @location.nodes
	end

	# If the nodes is set, should be able to access the nodes
	def test_nodes_of_museum
		assert_equal @location, @location2.nodes[0]
	end

	# If the nodes are set, should be able to access the node name via the object
	def test_accessing_node_name
		assert_equal "Hillman", @location2.nodes[0].name
	end

	# If the locations is set, should be able to access the location
	def test_count_nodes_of_fourth_ave
		assert_equal 1, @location2.nodes.count
	end

	
end
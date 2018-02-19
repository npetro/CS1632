#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './locations.rb'

class TestLocations < Minitest::Test

	def setup
		@test_locations = Locations.new()
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates locations array with all 6 locations
	# locations = [6] -> not 0
	# locations = [6] -> locations.count returns 6
	# locations = [6] -> locations.count does not return 7

	# If the initialization worked, should not be 0
	def test_number_of_roads_not_zero
		refute_equal 0, @test_locations.locations.count
	end

	# If the initialization worked, should be 6 locations in the array
	def test_number_of_roads
		assert_equal 6, @test_locations.locations.count
	end

	# If the initialization worked, should not have 7 locations in the array
	def test_not_number_of_roads
		refute_equal 7, @test_locations.locations.count
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates roads array with all 4 roads
	# locations contains Hospital -> test_locations.locations includes Hospital
	# locations does not contain Benedum -> test_locations.locations does not include Benedum

	# If the initialization worked, locations[] should include Hospital
	def test_roads_includes_hospital
		assert_includes "Hospital", @test_locations.locations[0].name
	end

	# If the initialization worked, locations[] should not inlcude Benedum
	def test_roads_doesnt_include_bendum
		refute_includes "Benedum", @test_locations.locations[2].name
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates locations array with all 6 locations
	# ho.nodes -> ho.nodes returns 2 nodes
	# ho.nodes -> ho.nodes returns not 3 nodes
	# ho.nodes -> ho.nodes returns the two nodes specified to be connected to the hospital

	# If the initialization worked, ho.nodes[] should have 2 nodes
	def test_number_of_nodes_on_hospital
		assert_equal 2, @test_locations.locations[0].nodes.count
	end

	# If the initialization worked, ho.nodes[] should not have 3 nodes
	# EDGE CASE
	def test_number_of_nodes_on_hospital
		refute_equal 3, @test_locations.locations[0].nodes.count
	end

	# If the initialization worked, ho.nodes[] should have these 2 nodes
	def test_correct_nodes_for_hospital
		assert_equal [@test_locations.locations[1],@test_locations.locations[2]], @test_locations.locations[0].nodes
	end


end
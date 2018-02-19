#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './roads.rb'

class TestRoads < Minitest::Test

	def setup
		@test_roads = Roads.new()
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates roads array with all 4 roads
	# roads = [4] -> not nil
	# roads = [4] -> roads.count returns 4
	# roads = [4] -> roads.count does not return 5

	# If the initialization worked, should not be nil
	def test_number_of_roads_not_nil
		refute_equal 0, @test_roads.roads.count
	end

	# If the initialization worked, should be 4 roads in the array
	def test_number_of_roads
		assert_equal 4, @test_roads.roads.count
	end

	# If the initialization worked, should not have 5 roads in the array
	def test_not_number_of_roads
		refute_equal 5, @test_roads.roads.count
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates roads array with all 4 roads
	# roads contains Fourth Ave. -> test_roads.roads includes fourth
	# roads does not contain Eighth Ave. -> test_roads.roads does not include eighth

	# If the initialization worked, roads[] should include fourth
	def test_roads_includes_fourth
		assert_includes "Fourth Ave.", @test_roads.roads[0].name
	end

	# If the initialization worked, roads[] should not inlcude eighth
	def test_roads_doesnt_include_eighth
		refute_includes "Eighth Ave.", @test_roads.roads[2].name
	end

	# UNIT TESTS FOR METHOD initialize()
	# Equivalence classes:
	# new() -> creates roads array with all 4 roads
	# foo.locations -> foo.locations returns 2 locations
	# foo.locations -> foo.locations returns the two locations specified to be connected by Foo St.

	# If the initialization worked, foo.locations[] should have 2 locations
	def test_number_of_locations_on_foo
		assert_equal 2, @test_roads.roads[1].locations.count
	end

	# If the initialization worked, foo.locations[] should have these 2 locations
	def test_correct_locations_on_foo
		assert_equal ["Hospital","Hillman"], @test_roads.roads[1].locations
	end

	# UNIT TESTS FOR METHOD find_via(loc1, loc2)
	# Equivalence classes:
	# find_via("Hospital", "Hillman") -> returns foo
	# find_via("Hospital", "Museum") -> returns false
	# find_via("Hospital", "Bob") -> returns false

	# find_via should be able to find the road that connects these two locations
	def test_find_via_returns_foo
		assert_equal @test_roads.roads[1], @test_roads.find_via("Hospital", "Hillman")
	end

	# find_via should not be able to find the road that connects these two locations
	# EDGE CASE
	def test_find_via_returns_error_known_locations
		assert_equal false, @test_roads.find_via("Hospital", "Museum")
	end

	# find_via should not be able to find the road that connects these two locations because "Bob doesn't exist"
	# EDGE CASE
	def test_find_via_returns_error_unknown_locations
		assert_equal false, @test_roads.find_via("Hospital", "Bob")
	end
end
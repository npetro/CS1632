#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './driver.rb'

class TestDriver < Minitest::Test

	def setup
		@test_driver = Driver.new(1, "Cathedral")
	end

	# UNIT TESTS FOR METHOD initalize(number, location)
	# Equivalence classes:
	# number = 1 -> test_driver.number = 1
	# location = "Cathedral" -> test_driver.location = "Cathedral"
	# test_driver.books = 0
	# test_driver.dinos = 0
	# test_driver.classes = 1

	# Given 1 at runtime, test_driver.number = 1
	def test_proper_number_assignment
		assert_equal 1, @test_driver.number
	end

	# Given "Cathedral" at runtime, test_driver.location = "Cathedral"
	def test_proper_location_assignment
		assert_equal "Cathedral", @test_driver.location
	end

	# test_driver.books = 0
	def test_proper_number_of_books
		assert_equal 0, @test_driver.books
	end

	# test_driver.dinos = 0
	def test_proper_number_of_dinos
		assert_equal 0, @test_driver.dinos
	end

	# test_driver.classes = 1
	def test_proper_number_of_classes
		assert_equal 1, @test_driver.classes
	end

	# UNIT TESTS FOR METHOD update
	# Equivalence classes:
	# location = "Cathedral" -> test_driver.classes * 2
	# location = "Hillman" -> test_driver.books + 1
	# location = "Museum" -> test_driver.dinos + 1

	# Given "Cathedral" at runtime
	def test_proper_update_classes
		@test_driver.location = "Cathedral"
		@test_driver.update
		assert_equal 2, @test_driver.classes
	end

	# Given "Hillman" at runtime
	def test_proper_update_books
		@test_driver.location = "Hillman"
		@test_driver.update
		assert_equal 1, @test_driver.books
	end

	# Given "Museum" at runtime
	def test_proper_update_dinos
		@test_driver.location = "Museum"
		@test_driver.update
		assert_equal 1, @test_driver.dinos
	end
end
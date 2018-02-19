#Nick Petro - CS1632 Spring 2018 - Deliverable 2
require 'minitest/autorun'
require './iteration.rb'

class TestIterator < Minitest::Test

	def setup
		@test_iter = Iterate.new
	end

	# UNIT TESTS FOR METHOD check_seed(arg)
	# Equivalence classes:
	# arg = 2 -> returns 2
	# arg = 2.2 -> returns 0
	# arg = -2 -> returns 0
	# arg = "bob" -> returns 0

	# Given 2 at runtime, should return 2
	def test_check_seed_int
		assert_equal 2, @test_iter.check_seed(2)
	end

	# Given 2.2 at runtime, should return 0
	def test_check_seed_float
		assert_equal 0, @test_iter.check_seed(2.2)
	end

	# Given -2 at runtime, should return 0
	def test_check_seed_neg
		assert_equal -2, @test_iter.check_seed(-2)
	end

	# Given "bob" at runtime, should return 0
	def test_check_seed_string
		assert_equal 0, @test_iter.check_seed("bob")
	end

	# Given 2147483647 at runtime, should return 2147483647
	# EDGE CASE
	def test_check_seed_max_int
		assert_equal 2147483647, @test_iter.check_seed(2147483647)
	end

	# Given -2147483648 at runtime, should return -2147483648
	# EDGE CASE
	def test_check_seed_min_int
		assert_equal -2147483648, @test_iter.check_seed(-2147483648)
	end

	# UNIT TESTS FOR METHOD check_leaving(location)
	# Equivalence classes:
	# location = "Downtown" -> returns false (telling the loop to stop)
	# location = "Hospital" -> returns true (telling the loop to continue)

	# Given "Downtown" at runtime, should return false
	def test_check_leaving_false
		assert_equal false, @test_iter.check_leaving("Downtown")
	end

	# Given "Hospital" at runtime, should return true
	def test_check_leaving_true
		assert_equal true, @test_iter.check_leaving("Hospital")
	end
end
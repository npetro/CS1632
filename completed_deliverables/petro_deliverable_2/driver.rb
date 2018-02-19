#Nick Petro - CS1632 Spring 2018 - Deliverable 2
class Driver
	# Creates a new Driver
	attr_accessor :number
	attr_accessor :location
	attr_accessor :classes
	attr_accessor :books
	attr_accessor :dinos

	def initialize number, location
		@number = number
		@location = location
		@books = 0
		@dinos = 0
		@classes = 1
	end

	def update
		if @location == "Hillman"
			@books = @books + 1
		end
		if @location == "Museum"
			@dinos = @dinos + 1
		end
		if @location == "Cathedral"
			@classes = @classes * 2
		end
	end

	def output
		if @books == 1
			puts "Driver #{@number} obtained #{@books} book!"
		else
			puts "Driver #{@number} obtained #{@books} books!"
		end
		if @dinos == 1
			puts "Driver #{@number} obtained #{@dinos} dinosaur toy!"
		else
			puts "Driver #{@number} obtained #{@dinos} dinosaur toys!"
		end
		if @classes == 1
			puts "Driver #{@number} attended #{@classes} class!"
		else
			puts "Driver #{@number} attended #{@classes} classes!"
		end
	end
end
class Player
	attr_accessor :won
	attr_reader :marker, :name

	@@instances = 0

	def initialize(marker)
		@marker = marker unless marker_error?(marker)
		@won = false
		@@instances += 1
		@name = "P#{@@instances}"
	end

	def has_won?
		@won
	end

	def win
		@won = true
		puts "#{@name} won"
	end

	def marker
		@marker
	end

	def name
		@name
	end

	def your_move
		print "\n#{name}, make a move: "
		move = gets.chomp
		move
	end

	def marker_error?(marker)
		@marker = marker
		if @marker == "X" or @marker == "O"
			false
		else
			print "\nThat is an invalid marker. Please choose X or O: "
			@marker = gets.chomp
		end
	end

end


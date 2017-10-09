class Board 
	@@positions = {
		1 => [2,0],
		2 => [2,1],
		3 => [2,2],
		4 => [1,0],
		5 => [1,1],
		6 => [1,2],
		7 => [0,0],
		8 => [0,1],
		9 => [0,2]
	}


	def initialize
		@board = [Array.new(3), Array.new(3), Array.new(3)]
		@i=10
		@board.each do |x|
			x.map! { |c| c = @i; @i -= 1 }
			x.reverse!
		end
	end

	def show
		puts "\n\t  #{@board[0].join("  |  ")}"
		puts "\t_  _  _  _  _  _\n\n"
		puts "\t  #{@board[1].join("  |  ")}\n"
		puts "\t_  _  _  _  _  _\n\n"
		puts "\t  #{@board[2].join("  |  ")}\n\n"
	end	

	def play(position)
		@position = position
		@board[@@positions[@position][0]][@@positions[@position][1]] = "X"
	end

end 


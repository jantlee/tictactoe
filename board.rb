class Board 
	attr_reader :status

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
		@plays = 0
		@status = "continue"
	end

	def show
		# puts "\n\t  #{@board[0].join("  |  ")}"
		# puts "\t_  _  _  _  _  _\n\n"
		# puts "\t  #{@board[1].join("  |  ")}\n"
		# puts "\t_  _  _  _  _  _\n\n"
		# puts "\t  #{@board[2].join("  |  ")}\n\n"
	
		puts "\n  #{@board[0].join("  |  ")}"
		puts "_  _  _  _  _  _\n\n"
		puts "  #{@board[1].join("  |  ")}\n"
		puts "_  _  _  _  _  _\n\n"
		puts "  #{@board[2].join("  |  ")}\n\n"
	end	

	def play(position, player)
		@position = position.to_i
		# puts @position.is_a? Integer
		@sub_array = @@positions[@position]
		# puts @sub_array
		
		@board[@sub_array[0]][@sub_array[1]] = player
		# puts @board[0][0]
		@plays += 1
	end

	def over?
		@status_array = Array.new
		@board.each do |row|
			 row.each { |cell|  @status_array.push(cell) if cell.is_a? Integer}
		end

		if @status_array.length == 0
			@status = "stop"
			return "draw"
		end
	end

	def status
		@status
	end

end 

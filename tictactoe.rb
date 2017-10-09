require_relative 'board'
require_relative 'player'

puts "Let's play Tic Tac Toe"

game = Board.new

print "\nPlayer 1, pick X or O: "
marker = gets.chomp

p1 = Player.new(marker)
puts "You have selected '#{p1.marker}'"

if p1.marker == "X" 
	(p2 = Player.new("O"))
else
	(p2 = Player.new("X"))
end
puts "Player 2 will be '#{p2.marker}'"

game.show

until p1.has_won? == true or p2.has_won? == true or game.over? == "draw"
	game.play(p1.your_move, p1.marker)
	# game.over?
	game.show
	if game.over? == "draw"
		puts "Draw"
	else 
		p1.win if game.over? === "p1";
		# puts "game status #{game.status}"
		#if this causes a win evoke game over which calls p1.win
		if p1.has_won? == false
			game.play(p2.your_move, p2.marker)
			# game.over?
			game.show
			p2.win if game.over? == "p2";
			# puts "game status #{game.status}"
		end
	end
end
class TickGame

def initialize
	@position_array = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
	@current_player = "X"
end

def draw #Draws the tick tack toe board
	puts ""
	puts ""
	puts "  #{@position_array[0]}     |     #{@position_array[1]}     |     #{@position_array[2]}  "
	puts " ---------------------------"
	puts "  #{@position_array[3]}     |     #{@position_array[4]}     |     #{@position_array[5]}  "   
	puts " ---------------------------"   
	puts "  #{@position_array[6]}     |     #{@position_array[7]}     |     #{@position_array[8]}  "   
	puts ""
	puts ""
end

def take_input #Takes an input from the user
	puts "Choose an open position, player #{@current_player}!"
	input = gets.chomp
	if @position_array[input.to_i] == input
		@position_array[input.to_i] = @current_player
	else
		puts "Error: This spot is already taken"
		take_input
	end
end


def player_turn #Keeps track of which player's turn it is
	if @current_player == "X"
		@current_player = "O"
	else
		@current_player = "X"
	end
end


def winner_check #Checks between each round for a winning condition
	if [@position_array[0], @position_array[1], @position_array[2]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[3], @position_array[4], @position_array[5]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[6], @position_array[7], @position_array[8]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[0], @position_array[3], @position_array[6]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[2], @position_array[5], @position_array[8]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[0], @position_array[4], @position_array[8]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	elsif [@position_array[2], @position_array[4], @position_array[6]].all?{|pos| pos == @current_player}
		draw
		puts "Player #{@current_player} wins!"
		new_game
	end
end
end


def play #Loops through the game until one player wins
	instance = TickGame.new
	9.times do
		instance.draw
		instance.take_input
		instance.winner_check
		instance.player_turn
	end
	puts "It's a tie!"
	new_game
end

def new_game #Gives the player the option to start a new game or quit
	puts "n for new game"
	puts "q to quit"
	new_game = gets.chomp
	if new_game == "n"
		play
	elsif new_game == "q"
		exit
	else
		puts "Error, this is not a valid command"
	end
end

new_game
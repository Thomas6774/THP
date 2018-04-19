require 'colorize'

class BoardCase
	attr_accessor :value, :full

	def initialize(row,column)
		@value = "  "
		@full = false
	end

end

class Board
	attr_accessor :game_end, :victory_reason, :case11, :case12, :case13, :case21, :case22, :case23, :case31, :case32, :case33

	def initialize
		@game_end = false
		@game_end_reason = " "
		@case11 = BoardCase.new(1,1)
		@case12 = BoardCase.new(1,2)
		@case13 = BoardCase.new(1,3)
		@case21 = BoardCase.new(2,1)
		@case22 = BoardCase.new(2,2)
		@case23 = BoardCase.new(2,3)
		@case31 = BoardCase.new(3,1)
		@case32 = BoardCase.new(3,2)
		@case33 = BoardCase.new(3,3)
	end

	def check_if_line_completed(symbol)
		completed_line = false
		vector = [symbol,symbol,symbol]
		completed_row_or_column = ([case11.value, case12.value, case13.value] == vector || [case21.value, case22.value, case23.value] == vector || [case31.value, case32.value, case33.value] == vector || [case11.value, case21.value, case31.value] == vector || [case12.value, case22.value, case32.value] == vector || [case13.value, case23.value, case33.value] == vector)
		completed_diagonal = false
		completed_diagonal = ([case11.value, case22.value, case33.value] == vector)
		completed_anti_diagonal = false
		completed_anti_diagonal = ([case13.value, case22.value, case31.value] == vector)
		completed_line = (completed_row_or_column || completed_diagonal || completed_anti_diagonal)
		completed_line 
	end

	def check_if_board_full
		board_is_full = false
		if (case11.value != "  ") && (case12.value  != "  ") && (case13.value  != "  ") && (case21.value  != "  ") && (case22.value  != "  ") && (case23.value  != "  ") && (case31.value  != "  ") && (case32.value  != "  ") && (case33.value  != "  ")
			board_is_full = true
		end
		board_is_full
	end	

	def display_board
		puts ""
		puts ""
		puts "=====TIC TAC TOE=====".colorize(:color => :black, :background => :light_blue)
		puts ""
		puts "Ligne 1 => [".colorize(:light_blue) + "#{@case11.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case12.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case13.value}".colorize(:red) + "]".colorize(:light_blue)
		puts ""
		puts "Ligne 2 => [".colorize(:light_blue) + "#{@case21.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case22.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case23.value}".colorize(:red) + "]".colorize(:light_blue)
		puts ""
		puts "Ligne 3 => [".colorize(:light_blue) + "#{@case31.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case32.value}".colorize(:red) + "|".colorize(:light_blue) + "#{@case33.value}".colorize(:red) + "]".colorize(:light_blue)
		puts ""
		puts "=====================".colorize(:color => :black, :background => :light_blue)
		puts ""
		puts ""
	end

	def check_if_case_already_taken(case_row,case_column)
		if eval("case#{case_row}#{case_column}.full == true")
			return true
		else
			return false
		end
	end

	def update_case(case_row,case_column,symbol)
		eval("@case#{case_row}#{case_column}.value = symbol")
		eval("@case#{case_row}#{case_column}.full = true")
	end

end

class Player
	attr_accessor :name, :symbol

	def initialize
		print " entrez votre nom : ".colorize(:yellow)
		a = gets.chomp
		@name = a
		@symbol = ""
	end

	def chose_case
		puts "#{name}, choisissez une case".colorize(:yellow)
		puts "Ligne 1, 2 ou 3".colorize(:yellow)
		case_row = gets.chomp.to_i
		
		while case_row > 3 || case_row < 1
			puts "LIGNE INEXISTANTE. REESSAYEZ".colorize(:yellow)
			puts "Ligne 1, 2 ou 3".colorize(:yellow)
			case_row = gets.chomp.to_i
		end
		
		puts "Colonne 1, 2 ou 3".colorize(:yellow)
		case_column = gets.chomp.to_i
		while case_column > 3 || case_column < 1
			puts "LIGNE INEXISTANTE. REESSAYEZ".colorize(:yellow)
			puts "Colonne 1, 2 ou 3".colorize(:yellow)
			case_column = gets.chomp.to_i
		end
		return [case_row,case_column]
	end

	def def_symbol(symbols)
		@symbol = symbols
	end

end

class Game
	attr_accessor :name_game, :board1, :player1, :player2

	def initialize(name_of_the_game)
		@name_game = name_of_the_game
		@board1 = Board.new
		puts "#######################################".colorize(:light_blue)
		puts "#                                     #".colorize(:light_blue)
		puts "#                                     #".colorize(:light_blue)
		puts "#              BIENVENUE              #".colorize(:light_blue)
		puts "#                                     #".colorize(:light_blue)
		puts "#       ".colorize(:light_blue) + "TIC".colorize(:red) + "       " + "TAC".colorize(:green) + "       " + "TOE".colorize(:yellow) + "       #".colorize(:light_blue)
		puts "#                                     #".colorize(:light_blue)
		puts "#                                     #".colorize(:light_blue)
		puts "#######################################".colorize(:light_blue)
		print "Joueur 1,".colorize(:yellow)
		@player1 = Player.new
		player1.def_symbol("><")
		print "Joueur 2,".colorize(:yellow)
		@player2 = Player.new
		player2.def_symbol("ôÔ")

		launch_the_game
	end

	def update_game_status
		game_end_reason = ""
		if  board1.check_if_line_completed("><")
			@board1.game_end = true
			game_end_reason = "Fin du jeu, #{player1.name} a écrasé #{player2.name}!".colorize(:yellow)
			board1.display_board
		elsif board1.check_if_line_completed("ôÔ")
			@board1.game_end = true
			game_end_reason = "Fin du jeu, #{player2.name} a écrasé #{player1.name}!".colorize(:yellow)
			board1.display_board
		elsif board1.check_if_board_full
			@board1.game_end = true
			game_end_reason = "Pas de vainqueur.".colorize(:yellow)
			board1.display_board
		end
		puts game_end_reason
		@board1.game_end
	end

	def launch_the_game

		until board1.game_end == true
			board1.display_board
			choice = player1.chose_case
				while board1.check_if_case_already_taken(choice[0],choice[1])
					puts "Case déjà pleine, choisir une autre :".colorize(:yellow)
					board1.display_board
					choice = player1.chose_case
				end
			board1.update_case(choice[0],choice[1], player1.symbol)
			
			update_game_status
			
			if board1.game_end != true
				board1.display_board
				choice = player2.chose_case
					while board1.check_if_case_already_taken(choice[0],choice[1])
						puts "Case déjà pleine, choisir une autre :".colorize(:yellow)
						board1.display_board
						choice = player2.chose_case
					end
				board1.update_case(choice[0],choice[1], player2.symbol)
				
				update_game_status
			end
		end
	end
end


tic_tac_toe = Game.new("Tic Tac Toe")
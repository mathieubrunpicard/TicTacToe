
require 'pry'
require_relative 'player'
require_relative 'board'

class Game

  def initialize
    board_instance = Board.new

  #Create the two players
  player_1 = Player.new("X")
  player_2 = Player.new("O")

  #Call the board_card_start method
  #And create the 9 cases of the games
  board_instance.board_card_start
  end

def round
  #Starting game
  9.times do |i|

    user_move = 0

    Player.offsprings.each do |l|

      puts "\n------------------ Round number #{i+1} ------------------"

      puts l.player_name + ", it's your turn."
      puts "Where are you going to play ? [1-9]"
      user_move = gets.chomp.to_i - 1

      validation = board_instance.sign_case(user_move)

      board_instance.correct_input(validation, l.symbol)

      board_instance.print_table

      test_winning = board_instance.winning(l)

      if test_winning == true

        puts "Congratulations " + l.player_name + ", you won."
        puts "\n-------------------------------------------------------"
        exit(l.winning)
      end
      i = i + 1
    end

    puts "\n-------------------------------------------------------"

    #If this is turn 9 and nobody won break the game
    break if i == 8 && player_1.winning == player_2.winning
    end


    #Display ending message based on the result of the game
    if player_1.winning == player_2.winning
      puts "\n-------------------------------------------------------"
      puts "It is a square. Nobody won"
      puts "\n-------------------------------------------------------"
    end

  end
end

script = Game.new
script.round






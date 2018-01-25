require_relative 'board_card'
require 'pry'

class Board

  def board_card_start
    up_left = Board_card.new
    up_center = Board_card.new
    up_right = Board_card.new
    middle_left = Board_card.new
    middle_center = Board_card.new
    middle_right = Board_card.new
    down_left = Board_card.new
    down_center = Board_card.new
    down_right = Board_card.new

    @board = [up_left,up_center,
      up_right,
      middle_left,
      middle_center,
      middle_right,
      down_left,
      down_center,
      down_right]
    end


#Put on the player's sign on the designated case
def sign_case(user_move)

  input = [0, 1, 2, 3, 4, 5, 6 ,7, 8]
  first_loop = false
  second_loop = false
  until first_loop && second_loop
    until input.include? user_move
      puts "Not correct"
      puts "Try again"
      user_move = gets.chomp.to_i - 1
    end
    first_loop = true
    until  @board[user_move].status == ""
      puts "Not correct"
      puts "Try again"
      user_move = gets.chomp.to_i - 1
    end
    second_loop = true
  end

  user_move
end

def correct_input(user_move, user_symbol)

  @board[user_move].status = user_symbol

end

def print_table

  puts ""
  puts "                  " + @board[0].status + " | " + @board[1].status + " | " +  @board[2].status
  puts "                 -------------"
  puts "                  " + @board[3].status + " | " + @board[4].status + " | " +  @board[5].status
  puts "                 -------------"
  puts "                  " + @board[6].status + " | " + @board[7].status + " | " +  @board[8].status
  puts ""
end

  def winning(player)

      wins_scenario = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
      [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
    ]

    wins_scenario.each do |scenario|
    sum = 0
      scenario.each do |tile|

        if @board[tile].status == player.symbol
          sum += 1
          if sum == 3

            player.winning = true
            return player.winning
            break
          else
            player.winning = false
          end
        end
      end
    end

  end
end



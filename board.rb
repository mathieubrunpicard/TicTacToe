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

#Loop to take out unproper number
def input_filter(user_move)
  while user_move < 0 || user_move > 9 || user_move.integer? == false
    puts "Not a valid move"
    puts "Where are you going to play ? [1-9]"
    user_move = gets.chomp.to_i - 1
  end
  true
end

#Put on the player's sign on the designated case
def sign_case(user_move, user_symbol)

  while @board[user_move].status == "X" || @board[user_move].status == "O"
    puts "Pay attention. This move has already been played"
    puts "Try again"
    user_move = gets.chomp.to_i - 1
  end
  true
end

def correct_input(user_move, user_symbol)


@board[user_move].status = user_symbol
end

def print_table

  puts ""
  puts "                  " + @board[0].status + " | " + @board[1].status + " | " +  @board[2].status+ " |"
  puts "                 -------------"
  puts "                  " + @board[3].status + " | " + @board[4].status + " | " +  @board[5].status+ " |"
  puts "                 -------------"
  puts "                  " + @board[6].status + " | " + @board[7].status + " | " +  @board[8].status+ " |"
  puts ""
end

def winning(player)

  wins_scenario = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
  [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
  [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
]
sum = 0
wins_scenario.each do |scenario|
  scenario.each do |i|

   if @board[i].status == player.symbol
    sum +=1
  end
end
end

if sum == 3
  player.winning = true
else
  player.winning = false
end

end
end

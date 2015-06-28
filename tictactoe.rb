require 'pry'

#1. Come up with requirements/specifications which will determine the scope
#2. Application logic: sequence of steps
#3. Translation of those steps into code.
#4. Run code to verify logic

#print 3x3 table to the screen
#accept player choice of empty square
#display table with player choice
#have computer choose an empty square
#determine winner/tie(board full)/or go to next move
#ask player to play again or quit
def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  b
end



def draw_board(b)
  system 'clear'
  puts "#{b[1]}|#{b[2]}|#{b[3]}"
  puts "-+-+-"
  puts "#{b[4]}|#{b[5]}|#{b[6]}"
  puts "-+-+-"
  puts "#{b[7]}|#{b[8]}|#{b[9]}"
end

def player_picks_square(board)
  puts "Pick a square (1 - 9): "
  position = gets.chomp.to_i
  while board[position] == 'O'
    puts "Square taken, pick again: "
    position = gets.chomp.to_i
  end
  board[position] = 'X' 
  #binding.pry
end

def empty_positions(board)
  board.select { |k, v| v == ' ' }.keys
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_condition = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_condition.each do |line|
    
    if board[line[0]] == 'X' &&  board[line[1]] == 'X' && board[line[2]] == 'X'
      return 'Player'
    elsif board[line[0]] == 'O'  && board[line[1]] == 'O' && board[line[2]] == 'O'
    return 'Computer'
    end        
  end
  return nil
end



#board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' '}
my_board = initialize_board
draw_board(my_board)


begin
  
  player_picks_square(my_board)
  winner = check_winner(my_board)
  computer_picks_square(my_board)
  draw_board(my_board)
  winner = check_winner(my_board)
  
end until winner || empty_positions(my_board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end
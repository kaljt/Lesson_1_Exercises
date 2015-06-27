require 'pry'
#All players pick either Paper, Rock or Scissors
#compare: paper > rock, rock > scissors, scissors > paper

#3. Play again

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

puts "Welcome to Rock, Paper, Scissors!"

def player_wins(human,ai) 
  if human == 'p' && ai == 'r' || human == 's' && ai == 'p'  || human == 'r' && ai == 's'
    true
  else
    false
end
end


loop do 
  #player picks
  begin
    puts "++++++ RPS ++++++"
    puts "Pick one: (p,r,s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It's a tie!"
  elsif player_wins(player_choice,computer_choice)
    puts "You win!"
  else
    puts "You suck..."
  end
  p "With player choosing #{CHOICES[player_choice]} and machine picking #{CHOICES[computer_choice]}" 
  puts "Play again (y/n)"
  break if gets.chomp.downcase != 'y'


end

puts "Thanks for playing..."


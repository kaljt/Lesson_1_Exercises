#Deck of 52 Cards 4 suits

#Player places bet
#Deal one card face up to player
#Deal one card to computer face up
#Deal one card to player face up
#Deal one card to computer face down
#Player checks for Blackjack
#computer checks for Blackjack

# it's not blackjack 
#is it a soft hand? (ace with non 10 card)
#player stands or player hits
#check for player bust

#Display 2nd dealer card 

#if dealer has 17 
#  dealer stands
#else
#  is it a soft hand
#  dealer hits until he has 17 or higher or bust

#  Player hits or stands
require 'pry'

def draw_card(deck)
    random_card = [CARDS.sample, SUIT.sample]
      if !deck.key?(random_card[0])
      deck[random_card[0]] = [random_card[1]]
      drawn_card = random_card
      elsif
      !deck[random_card[0]].include?(random_card[1])
      deck[random_card[0]].push(random_card[1])
      drawn_card = random_card
      elsif deck.size == CARDS.count  && deck.values.flatten.count == COUNT  
        return
      else
       draw_card(deck)
      end

    #check if key/value exists
    #if it exists, generate randomly again
        #otherwise return generated value

end

def calculate_hand(hand)
  value = 0
  #puts hand
    hand.each do |count|
      value += count[0] if count[0].class == Fixnum
      value +=10 if count.include?("QUEEN")
      value +=10 if count.include?("KING")
      value +=10 if count.include?("JACK")
      #value +=11 if count.include?("ACE") && value <= 10
      #value +=1 if count.include?("ACE") && value > 10
      if count.include?("ACE") 
        if value <= 10
          value +=11
        else
          value +=1
        end
      end
    end
   return value

end

def player_bust(total)
  if total == 21
    status = "Blackjack"
  elsif total > 21
    status = "Bust"

  end
    

end

def print_player_hand(player_hand)
    p "player hand is " #+ player_hand[0].to_s + "of" + player_hand[1].to_s + "with a total of #{player_total}"
    player_hand.each do |value,suit|
    p "#{value} of #{suit}"
  end

end

def initialize_deck(deck)
  deck = {}
end

def black_jack(p_total,c_total)
  if p_total == 21
    puts "Player Wins!"
    winner = 'Player'
    
  elsif c_total == 21
    puts "Dealer wins! with #{c_total}"
    winner = 'Dealer'
    
  end
end


    #Clear the table, start a new game or quit.
    CARDS = [2,3,4,5,6,7,8,9,10,'JACK','QUEEN','KING','ACE']
    SUIT = ['HEARTS', 'DIAMONDS', 'SPADES', 'CLUBS']
    FACE_CARDS = ['JACK','QUEEN','KING']
    COUNT = 52
    #JACK = 10
    #QUEEN = 10
    #KING = 10
    #my_deck = Hash.new
    player_status = ' '
    while player_status != 'n' do
    card_count = 0
    my_deck = initialize_deck(my_deck)
    player_hand = []
    computer_hand = []
    game_over = false

    while !game_over do

    player_hand = player_hand.push(draw_card(my_deck))
    computer_hand = computer_hand.push(draw_card(my_deck))
    player_hand = player_hand.push(draw_card(my_deck))
    player_total = calculate_hand(player_hand)
    computer_hand = computer_hand.push(draw_card(my_deck))
    computer_total = calculate_hand(computer_hand)
    print_player_hand(player_hand)
    #p "player hand is " #+ player_hand[0].to_s + "of" + player_hand[1].to_s + "with a total of #{player_total}"
    #player_hand.each do |value,suit|
    #p "#{value} of #{suit}"
  
    p "computer hand is " #+ "#{computer_hand.first} " + " and face down card"
    p computer_hand[0][0].to_s + " of " + computer_hand[0][1].to_s
    
    winner = black_jack(player_total,computer_total)
    if winner == 'Player'  || winner == 'Dealer'
      game_over = true
      break
    end

      loop do
      puts "Hit(h) or Stand(s): "
      player_action = gets.chomp.downcase
      if player_action == 'h'
      player_hand = player_hand.push(draw_card(my_deck))
      player_total = calculate_hand(player_hand)
      status = player_bust(player_total)
      #p "player hand is " + "#{player_hand.flatten}"  + "with a total of #{player_total}"
      print_player_hand(player_hand)
      if status == 'Bust'
        game_over = true
        break
      end
      end
      break if player_action == 's'
      end


      #binding.pry
      if player_total > 21
        puts "Player busted with "
        puts print_player_hand(player_hand)
        break
      else
        puts "computer hand is "
        puts print_player_hand(computer_hand)
      while calculate_hand(computer_hand) < 17 do  
          computer_hand = computer_hand.push(draw_card(my_deck))
          computer_total = calculate_hand(computer_hand)
      end
      end
      if player_bust(computer_total) == 'Bust'
        puts "Dealer busted with "
        puts print_player_hand(computer_hand)
        p "#{computer_total}, Player wins!"
        game_over = true
      elsif player_total > computer_total
        puts "Player wins with "
        puts print_player_hand(player_hand)
        p "with #{player total} over #{computer_total}"
        game_over = true
      elsif player_total == computer_total
        puts "Player ties with dealer!"
        game_over = true
      elsif player_bust(computer_total)  == 'Blackjack'  || player_total < computer_total
        puts "Dealer wins with #{computer_total}"
        game_over = true
      end
      end
    #p "Computer hand is #{computer_hand}"
    puts "Do you want to play again? (y/n): "
    player_status = gets.chomp.downcase
  end

  

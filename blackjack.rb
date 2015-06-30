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
  puts hand
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

def game_over(total)
  if total == 21
    status = "Blackjack!"
  end
    

end


def deal_card(card)
  #get unique key,value pair from deck


end

def initialize_deck(deck)
  deck = {}
end

def black_jack(p_total,c_total)
  if p_total == 21
    puts "Player wins!"
    exit
  elsif c_total == 21
    puts "Dealer wins!"
    exit
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
    card_count = 0
    my_deck = initialize_deck(my_deck)
    player_hand = []
    computer_hand = []
    player_status = ' '
    while player_status != 'n' do
    player_hand = player_hand.push(draw_card(my_deck))
    #computer_card = draw_card(my_deck)
    computer_hand = computer_hand.push(draw_card(my_deck))
    player_hand = player_hand.push(draw_card(my_deck))
    player_total = calculate_hand(player_hand)
    computer_hand = computer_hand.push(draw_card(my_deck))
    computer_total = calculate_hand(computer_hand)
   p "player hand is " + "#{player_hand} " + "with a total of #{player_total}"
   p "computer hand is " + "#{computer_hand.first}"
   black_jack(player_total,computer_total)
   
   puts "Hit(h) or Stand(s): "
   player_action = gets.chomp.downcase
    if player_action == 'h'
    player_hand = player_hand.push(draw_card(my_deck))
     player_total = calculate_hand(player_hand)
    p player_total
    elsif player_action == 's'
      while calculate_hand(computer_hand) < 17 do  
          computer_hand = computer_hand.push(draw_card(my_deck))
      end
    p "Computer hand is #{computer_hand}"
    puts "Do you want to play again? (y/n): "
    player_status = gets.chomp.downcase
  end
end
   # p player_card
    #p computer_card
    #p my_deck
    #player_hand = player_card.push(draw_card(my_deck))
    #p player_card
    #p player_hand
    #hile card_count <= COUNT do 
    #     test = draw_card(my_deck)
    #     card_count +=1
    #     
    #   end
    #   puts "#{my_deck}"
    #   #puts test

    #Randomly pick a value between 1 and ACE
    #randomly pick a suit
    #check if card already exists in deck
    #if not then deal it
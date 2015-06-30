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
def pick_a_card(deck)
end


def deal_card(deck)
  #get unique key,value pair from deck

end

def initialize_deck(deck)
  deck = {CARDS.sample => SUIT.sample}
end



    #Clear the table, start a new game or quit.
    CARDS = [2,3,4,5,6,7,8,9,10,'jack','queen','king','ace']
    SUIT = ['HEARTS', 'DIAMONDS', 'SPADES', 'CLUBS']
    FACE_CARDS = ['JACK','QUEEN','KING']
    JACK = 10
    QUEEN = 10
    KING = 10
    #my_deck = Hash.new
    my_deck = initialize_deck(my_deck)
   puts my_deck

    #Randomly pick a value between 1 and ACE
    #randomly pick a suit
    #check if card already exists in deck
    #if not then deal it
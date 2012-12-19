# 1.  get a deck
# 2.  create players and dealer
# 3.  deal 2 cards to everyone
# 3.5  check to see if dealer has 21
# 4.  ask each player if they want another card.
#     do so until either the player 'stays' or busts or hits 21 exactly
# 5.  deal cards to the dealer until his score > 17
# 6.  summary

#load '/Users/johnholton/Projects/_examples_/blackjack3/b.rb'
load '/Users/johnholton/Projects/_examples_/blackjack3/card.rb'
load '/Users/johnholton/Projects/_examples_/blackjack3/deck.rb'

deck = Deck.new

@player1 = {:hand => []}
@player2 = {:hand => []}
@dealer = {:name => "Dealer Tom", :hand => []}

puts "What is Player 1's name?"
@player1[:name] = gets.chomp

puts "What is Player 2's name?"
@player2[:name] = gets.chomp

2.times do
  @player1[:hand] << deck.cards.shift
  @player2[:hand] << deck.cards.shift
  @dealer[:hand] << deck.cards.shift
end

@dealer_hand_value = 0
@dealer_ace_count = 0
@dealer_ace_redux_count = 0

@dealer[:hand].each do |card|
  @dealer_hand_value += card.value
end

if @dealer_hand_value == 21
  puts "Dealer has blackjack, losers"
end

while @dealer_hand_value > 21 && @dealer_ace_count > @dealer_ace_redux_count
  @dealer_hand_value -= 10
  @dealer_ace_redux_count += 1
end


puts "Dealer's top card is #{@dealer[:hand].first}"

puts "#{@player1[:name]}, your hand is #{@player1[:hand].first}, and #{@player1[:hand].last}"

@player1_hand_value = 0
@player1_ace_count = 0
@player1_ace_redux_count = 0

@player1[:hand].each do |card|
  @player1_hand_value += card.value
  @player1_ace_count += 1 if card.value == 11
end

while @player1_hand_value > 21 && @player1_ace_count > @player1_ace_redux_count
  @player1_hand_value -= 10
  @player1_ace_redux_count += 1
end

#do so until either the player 'stay' or busts or hits 21 exactly
if @player1_hand_value == 21
  puts "#{@player1[:name]} congrats you have a blackjack!"
else
  puts "What do you want to do?"
  @action = gets.chomp
end

while @action != "stay" && @player1_hand_value < 21
  @player1[:hand] << deck.cards.shift
  @player1_hand_value += @player1[:hand].last.value
  @player1_ace_count += 1 if @player1[:hand].last.value == 11

  while @player1_hand_value > 21 && @player1_ace_count > @player1_ace_redux_count
    @player1_hand_value -= 10
    @player1_ace_redux_count += 1
  end

  puts "You were dealt the #{@player1[:hand].last}"

  if @player1_hand_value < 21
    puts "What do you want to do?"
    @action = gets.chomp
  elsif @player1_hand_value == 21
    puts "congrats! you have 21"
  else
    puts "you busted sorry!"
  end
end


puts "#{@player2[:name]}, your hand is #{@player2[:hand].first}, #{@player2[:hand].last}"

@player2_hand_value = 0
@player2_ace_count = 0
@player2_ace_redux_count = 0

@player2[:hand].each{|card| @player2_hand_value += card.value }
while @player2_hand_value > 21 && @player2_ace_count > @player2_ace_redux_count
  @player2_hand_value -= 10
  @player2_ace_redux_count += 1
end

#do so until either the player 'stay' or busts or hits 21 exactly
if @player2_hand_value == 21
  puts "#{@player2[:name]} congrats you have a blackjack!"
else
  puts "What do you want to do?"
  @action = gets.chomp
end

while @action != "stay" && @player2_hand_value < 21
  @player2[:hand] << deck.cards.shift
  @player2_hand_value += @player2[:hand].last.value
  @player2_ace_count += 1 if @player2[:hand].last.value == 11

  while @player2_hand_value > 21 && @player2_ace_count > @player2_ace_redux_count
    @player2_hand_value -= 10
    @player2_ace_redux_count += 1
  end

  puts "You were dealt the #{@player2[:hand].last}"

  if @player2_hand_value < 21
    puts "What do you want to do?"
    @action = gets.chomp
  elsif @player2_hand_value == 21
    puts "congrats! you have 21"
  else
    puts "you busted sorry!"
  end
end

puts "#{@dealer[:name]}'s hand is #{@dealer[:hand].first}, #{@dealer[:hand].last}"
while @dealer_hand_value < 17
  @dealer[:hand] << deck.cards.shift
  puts "Dealer was dealt the #{@dealer[:hand].last}"
  @dealer_hand_value += @dealer[:hand].last.value
  @dealer_ace_count += 1 if @dealer[:hand].last.value == 11

  while @dealer_hand_value > 21 && @dealer_ace_count > @dealer_ace_redux_count
    @dealer_hand_value -= 10
    @dealer_ace_redux_count += 1
  end

  if @dealer_hand_value  == 21
    puts "Dealer has blackjack"
  elsif @dealer_hand_value > 21
    puts "Dealer busted, everyone wins!!"
  elsif @dealer_hand_value < 17
    puts "Dealer must hit"
  else
    puts "Dealer has to stay"
  end
end

puts "#{@dealer[:name]} has a #{@dealer_hand_value}, #{@player1[:name]} has a #{@player1_hand_value}, and #{@player2[:name]} has a #{@player2_hand_value}"

if @player1_hand_value > 21
  puts "#{@player1[:name]} busted."
elsif @player1_hand_value == @dealer_hand_value
  puts "#{@player1[:name]}, it's a push."
elsif @player1_hand_value > @dealer_hand_value
  puts "Congrats #{@player1[:name]}, you have 21!" if @player1_hand_value == 21
  puts "#{@player1[:name]} wins."
elsif @dealer_hand_value > @player1_hand_value && @dealer_hand_value <= 21
  puts "Sorry #{@player1[:name]}, #{@dealer[:name]} wins."
else
  puts "YOU SHOULD NEVER SEE THIS."
end

if @player2_hand_value > 21
  puts "#{@player2[:name]} busted."
elsif @player2_hand_value == @dealer_hand_value
  puts "#{@player2[:name]}, it's a push."
elsif @player2_hand_value > @dealer_hand_value
  puts "Congrats #{@player2[:name]}, you have 21!" if @player2_hand_value == 21
  puts "#{@player2[:name]} wins."
elsif @dealer_hand_value > @player2_hand_value && @dealer_hand_value <= 21
  puts "Sorry #{@player2[:name]}, #{@dealer[:name]} wins."
else
  puts "YOU SHOULD NEVER SEE THIS."
end


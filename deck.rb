class Deck

  attr_reader :cards

  SUITS = [:clubs, :spades, :diamonds, :hearts]
  NAME_VALUES = {"2" => 2, "3" => 3, "4" => 4,
                   "5" => 5, "6" => 6, "7" => 7,
                   "8" => 8, "9" => 9, "10" => 10,
                   "J" => 10, "Q" => 10, "K" => 10, "A" => 11}

  def initialize
    @cards = []
    SUITS.each do |suit|
      NAME_VALUES.each do |name, value|
        #@deck << {suit: suit, name: name, value: value}
        @cards << Card.new(suit, name, value)
      end
    end
    @cards.shuffle!
  end

  def to_s
    "THIS IS A DECK"
  end

end

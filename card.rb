class Card

  attr_reader :suit, :name, :value

  def initialize(suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end

  def to_s
    "#{self.name} of #{self.suit}"
  end

end
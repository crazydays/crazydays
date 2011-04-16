require 'suit'

class InvalidCardError < StandardError
end

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    raise InvalidCardError unless (1..13) === value
    @value = value
  end

  def to_s
    "#{value_to_s} of #{suit_to_s}"
  end

  def value_to_s
    case @value
    when 13
      'king'
    when 12
      'queen'
    when 11
      'jack'
    when 1
      'ace'
    else
      @value.to_s
    end
  end

  def suit_to_s
    @suit.to_s
  end

  def eql?(card)
    @suit.eql?(card.suit) && @value.eql?(card.value)
  end
end

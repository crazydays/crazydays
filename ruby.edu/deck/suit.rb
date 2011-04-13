class InvalidSuitError < StandardError
end

class Suit
  attr_accessor :value

  def initialize(value)
    case value
    when :spade
    when :diamond
    when :club
    when :heart
    else
      raise InvalidSuitError, "Unknown suit: " + value.to_s
    end

    @value = value
  end

  def isBlack?
    @value == :spade || @value == :club
  end

  def isRed?
    @value == :heart || @value == :diamond
  end

  def eql?(s)
    @value == s.value
  end

  def to_s
    case @value
    when :spade
      'spades'
    when :diamond
      'diamonds'
    when :club
      'clubs'
    when :heart
      'hearts'
    end
  end

  SPADE = Suit.new(:spade)
  DIAMOND = Suit.new(:diamond)
  CLUB = Suit.new(:club)
  HEART = Suit.new(:heart)
end

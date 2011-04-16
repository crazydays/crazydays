require 'card'
require 'card_count'

class Hand
  attr_accessor :cards, :size

  def initialize(size = 5)
    @size = size
    @cards = []
  end

  def insert(card)
    raise CardCountError, "Too many cards" unless @cards.size < @size
    @cards << card
    @cards = @cards.sort_by { |a| [a.value, a.suit.to_s] }
  end

  def discard(index)
    (index.is_a?(Array) ? index : [index]).each { |i| @cards[i.to_i] = nil }
    @cards.compact!
  end

  def to_s()
    "#{@cards.join(', ')}"
  end
end


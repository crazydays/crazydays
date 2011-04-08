require 'card.rb'
require 'card_count.rb'
require 'pair.rb'
require 'two_pair.rb'
require 'three_kind.rb'
require 'straight.rb'
require 'flush.rb'
require 'full_house.rb'
require 'four_kind.rb'
require 'straight_flush.rb'

class Hand

  attr_accessor :cards, :size

  def initialize(size = 5)
    @size = size
    @cards = Array.new
  end

  def insert(card)
    raise CardCountError, "Too many cards" unless @cards.size < @size
    @cards << card
    @cards = @cards.sort_by { |a| [a.value, a.suit.to_s] }
  end

  def discard(index)
    raise CardCountError, "Not enough cards" unless index < @cards.size
    @cards[index] = nil
    @cards.compact!
  end

  def to_s()
    value = ''
    @cards.length.times do |i|
      if i > 0 then
        value << ', '
      end
      value << @cards[i].to_s
    end
    value
  end
end


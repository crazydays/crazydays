require 'hand.rb'
require 'high_card.rb'
require 'pair.rb'
require 'two_pair.rb'

class PokerEvaluator
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def score
    if match = TwoPair.match?(@hand.cards)
      TwoPair.score(@hand.cards, match)
    elsif match = Pair.match?(@hand.cards)
      Pair.score(@hand.cards, match)
    else
      HighCard.score(@hand.cards)
    end
  end
end

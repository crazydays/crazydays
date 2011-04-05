require 'hand.rb'
require 'pair.rb'
require 'high_card.rb'

class PokerEvaluator
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def score
    match = Pair.match?(@hand.cards)
    if match
      Pair.score(@hand.cards, match)
    else
      HighCard.score(@hand.cards)
    end
  end
end

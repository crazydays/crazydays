require 'hand.rb'
require 'high_card.rb'
require 'pair.rb'
require 'two_pair.rb'
require 'three_kind.rb'
require 'straight.rb'
require 'full_house.rb'
require 'four_kind.rb'

class PokerEvaluator
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def score
    if match = FourKind.match?(@hand.cards)
      FourKind.score(@hand.cards, match)
    elsif match = FullHouse.match?(@hand.cards)
      FullHouse.score(@hand.cards, match)
    elsif match = Flush.match?(@hand.cards)
      Flush.score(@hand.cards, match)
    elsif match = Straight.match?(@hand.cards)
      Straight.score(@hand.cards, match)
    elsif match = ThreeKind.match?(@hand.cards)
      ThreeKind.score(@hand.cards, match)
    elsif match = TwoPair.match?(@hand.cards)
      TwoPair.score(@hand.cards, match)
    elsif match = Pair.match?(@hand.cards)
      Pair.score(@hand.cards, match)
    else
      HighCard.score(@hand.cards)
    end
  end
end

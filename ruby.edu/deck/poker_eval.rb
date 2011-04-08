require 'high_card.rb'
require 'pair.rb'
require 'two_pair.rb'
require 'three_kind.rb'
require 'straight.rb'
require 'full_house.rb'
require 'four_kind.rb'
require 'straight_flush.rb'

class PokerEvaluator
  def score(cards)
    if match = StraightFlush.match?(cards)
      StraightFlush.score(cards, match)
    elsif match = FourKind.match?(cards)
      FourKind.score(cards, match)
    elsif match = FullHouse.match?(cards)
      FullHouse.score(cards, match)
    elsif match = Flush.match?(cards)
      Flush.score(cards, match)
    elsif match = Straight.match?(cards)
      Straight.score(cards, match)
    elsif match = ThreeKind.match?(cards)
      ThreeKind.score(cards, match)
    elsif match = TwoPair.match?(cards)
      TwoPair.score(cards, match)
    elsif match = Pair.match?(cards)
      Pair.score(cards, match)
    else
      HighCard.score(cards)
    end
  end
end

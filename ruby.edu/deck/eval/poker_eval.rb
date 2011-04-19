require 'eval/straight_flush'
require 'eval/four_kind'
require 'eval/full_house'
require 'eval/flush'
require 'eval/straight'
require 'eval/three_kind'
require 'eval/two_pair'
require 'eval/pair'
require 'eval/high_card'

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

require 'card_sort.rb'
require 'pair.rb'

module TwoPair
  def TwoPair.match?(cards)
    high = Pair.match?(cards)
    if high
      low = Pair.match?(CardSort.remainder(cards, high))
      [high, low] unless low == nil
    else
      nil
    end
  end

  def TwoPair.score(cards, match, modifier = 2000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match[0].first, 5)
    score += CardSort.score_card(match[1].first, 3)
    score += CardSort.score_cards(CardSort.remainder(cards, match.flatten), 1)
    score
  end
end

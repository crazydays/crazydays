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

  def TwoPair.score(cards, match, modifier = 2000)
    score = 0
    score += modifier
    score += CardSort.score(CardSort.remainder(cards, match.flatten), 1)
    score += 3 * 15
    score += match[1][0].value == 1 ? 14 : match[1][0].value
    score += 5 * 15
    score += match[0][0].value == 1 ? 14 : match[0][0].value
    score
  end
end

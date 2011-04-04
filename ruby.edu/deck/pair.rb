require 'card_sort.rb'

module Pair
  def Pair.match?(cards)
    CardSort.find_match(CardSort.by_value(cards), 2)
  end

  def Pair.score(cards, pair, modifier = 1000)
    score = 0
    score += modifier
    score += CardSort.score(CardSort.remainder(cards, pair), 3)
    score += 5 * 15
    score += pair.first.value == 1 ? 14 : pair.first.value
    score
  end
end

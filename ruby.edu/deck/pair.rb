require 'card_sort'

module Pair
  def Pair.match?(cards)
    CardSort.find_match(CardSort.by_value(cards), 2)
  end

  def Pair.score(cards, pair, modifier = 1000000)
    score = 0
    score += modifier
    score += CardSort.score_card(pair.first, 5)
    score += CardSort.score_cards(CardSort.remainder(cards, pair), 3)
    score
  end
end

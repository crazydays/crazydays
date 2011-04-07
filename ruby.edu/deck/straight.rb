require 'card_sort.rb'

module Straight
  def Straight.match?(cards)
    CardSort.find_run(CardSort.by_value(cards))
  end

  def Straight.score(cards, match, modifier = 4000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match.last, 5)
    score
  end
end

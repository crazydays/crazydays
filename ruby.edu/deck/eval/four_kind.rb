require 'eval/card_sort'

module FourKind
  def FourKind.match?(cards)
    CardSort.find_match(CardSort.by_value(cards), 4)
  end

  def FourKind.score(cards, match, modifier = 7000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match.first, 5)
    score += CardSort.score_cards(CardSort.remainder(cards, match), 1)
    score
  end
end

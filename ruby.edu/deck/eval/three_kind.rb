require 'eval/card_sort'

module ThreeKind
  def ThreeKind.match?(cards)
    CardSort.find_match(CardSort.by_value(cards), 3)
  end

  def ThreeKind.score(cards, match, modifier = 3000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match.first, 5)
    score += CardSort.score_cards(CardSort.remainder(cards, match), 2)
    score
  end
end

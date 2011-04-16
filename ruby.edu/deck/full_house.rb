require 'card_sort'

module FullHouse
  def FullHouse.match?(cards)
    triplet = CardSort.find_match(CardSort.by_value(cards), 3)
    unless triplet == nil
      pair = CardSort.find_match(CardSort.by_value(CardSort.remainder(cards, triplet)), 2)
      [triplet, pair] unless pair == nil
    end
  end

  def FullHouse.score(cards, match, modifier = 6000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match[0].first, 5)
    score += CardSort.score_card(match[1].first, 2)
    score
  end
end

require 'eval/card_sort'

module StraightFlush
  def StraightFlush.match?(cards)
    match = nil

    suits = CardSort.by_suit(cards)
    suits.values.each do |suit|
      if suit.size >= 5
        run = CardSort.find_run(CardSort.by_value(suit))
        match = run unless run == nil
      end
    end

    match
  end

  def StraightFlush.score(cards, match, modifier = 8000000)
    score = 0
    score += modifier
    score += CardSort.score_card(match.last, 5)
    score
  end
end

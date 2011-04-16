require 'card_sort'

module HighCard
  def HighCard.match?(cards)
    matches = Array.new
    values = CardSort.by_value(cards)
    [(2..13).to_a, 1].flatten!.reverse!.each do |i|
      matches << values[i]
      matches.flatten!
      break if matches.size == 5
    end
    matches
  end

  def HighCard.score(cards, modifier = 0)
    CardSort.score_cards(cards, 5)
  end
end

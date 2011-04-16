require 'suit'
require 'card_sort'

module Flush
  def Flush.match?(cards)
    flush = nil

    suits = CardSort.by_suit(cards)
    suits.values.each do |suit|
      if suit.size >= 5
        flush = suit
      end
    end

    unless flush == nil
      ordered = Array.new
      values = CardSort.by_value(flush)
      [(2..13).to_a, 1].flatten!.reverse!.each do |i|
        ordered << values[i]
      end

      ordered.flatten!.slice(0, 5)
    end
  end

  def Flush.score(cards, match, modifier = 5000000)
    score = 0
    score += modifier
    score += CardSort.score_cards(cards, 5)
    score
  end
end

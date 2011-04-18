require 'card'

module CardSort
  def CardSort.by_suit(unsorted)
    by_suit = Hash.new {|h, k| h[k] = []}
    unsorted.each {|c| by_suit[c.suit] << c }
    by_suit
  end

  def CardSort.by_value(unsorted)
    by_value = Hash.new {|h, k| h[k] = []}
    unsorted.each {|c| by_value[c.value] << c }
    by_value
  end

  def CardSort.find_match(by_value, size)
    match = nil

    [(2..13).to_a, 1].flatten!.reverse!.each do |i|
      if by_value[i].size == size
        match = by_value[i]
        break
      end
    end

    match
  end

  def CardSort.find_run(by_value, size = 5)
    best = nil
    current = []

    [(1..13).to_a, 1].flatten!.each do |i|
      if by_value[i].size > 0
        current << by_value[i].last
      else
        best = current unless current.size < size
        current = []
      end
    end

    best = current unless current.size < size
    best
  end

  def CardSort.remainder(unsorted, matched)
    unsorted - matched
  end

  def CardSort.score_cards(unsorted, count = 5)
    score = 0
    values = CardSort.by_value(unsorted)
    place = [unsorted.size, count].min
    [(2..13).to_a, 1].flatten!.reverse!.each do |i|
      if values[i].size > 0
        score += CardSort.score_card(values[i].first, place)
        place -= 1
      end

      break unless place > 0
    end
    score
  end

  def CardSort.score_card(card, place)
    (15 ** (place - 1)) * (card.value == 1 ? 14 : card.value)
  end
end

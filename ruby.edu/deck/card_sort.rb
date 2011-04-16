require 'card'

module CardSort
  def CardSort.by_suit(cards)
    suits = Hash.new{|h, k| h[k] = []}
    cards.each {|c| suits[c.suit] << c }
    suits
  end

  def CardSort.by_value(cards)
    values = Hash.new{|h, k| h[k] = []}
    cards.each {|c| values[c.value] << c }
    values
  end

  def CardSort.find_match(cards, size)
    match = nil

    [(2..13).to_a, 1].flatten!.reverse!.each do |i|
      if cards[i].size == size
        match = cards[i]
        break
      end
    end

    match
  end

  def CardSort.find_run(cards, size = 5)
    best = nil
    current = Array.new

    [(1..13).to_a, 1].flatten!.each do |i|
      if cards[i].size > 0
        current << cards[i].last
      else
        best = current unless current.size < size
        current = Array.new
      end
    end

    best = current unless current.size < size
    best
  end

  def CardSort.remainder(cards, matched)
    cards - matched
  end

  def CardSort.score_cards(cards, count = 5)
    score = 0
    values = CardSort.by_value(cards)
    place = [cards.size, count].min
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

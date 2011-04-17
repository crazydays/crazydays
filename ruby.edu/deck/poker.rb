require 'ui/ui'
require 'deck'
require 'card'
require 'hand'
require 'eval/poker_eval'

class Poker
  attr_accessor :players, :deck, :hands

  def initialize(ui = UI.new, players = 5)
    @ui = ui
    @players = players
    @evaluator = PokerEvaluator.new()
  end

  def shuffle()
    @deck = Deck.new
    @deck.shuffle!
  end

  def deal()
    @hands = Array.new()
    (1..@players).each { |i| @hands[i] = Hand.new }
    (1..5).each do
      (1..players).each do |i|
        @hands[i].insert(@deck.deal)
      end
    end
  end

  def discard()
    (1..@players).each do |i|
      @ui.print(@hands[i].to_s)
      discards = @ui.prompt('Discard?').chomp.split(/, */).sort.reverse
      @hands[i].discard(discards)
    end
  end

  def redeal()
    (1..@players).each do |i|
      until @hands[i].cards.size == 5
        @hands[i].insert(@deck.deal)
      end
    end
  end

  def print()
    (1..@players).each { |i| @ui.print(@hands[i].to_s) }
  end

  def winner()
    winner = nil
    @hands.each do |hand|
      unless winner == nil
        winner = @evaluator.score(winner.cards) > @evaluator.score(hand.cards) ? winner : hand
      else
        winner = hand
      end
    end
    @ui.print "Winner! #{winner}"
    winner
  end
end

require 'ui/ui'
require 'deck'
require 'card'
require 'hand'
require 'player'
require 'eval/poker_eval'

class Poker
  attr_accessor :players, :deck

  def initialize(ui = UI.new, count = 5)
    @ui = ui
    @players = []
    count.times { |x| @players << Player.new }
    @evaluator = PokerEvaluator.new
  end

  def shuffle()
    @deck = Deck.new
    @deck.shuffle!
  end

  def deal()
    (1..5).each do |i|
      @players.each { |player| player.hand.insert(@deck.deal) }
    end
  end

  def discard()
    @players.each do |player|
      @ui.print(player.hand.to_s)
      discards = @ui.prompt('Discard?').chomp.split(/, */).sort.reverse
      player.hand.discard(discards)
    end
  end

  def redeal()
    @players.each do |player|
      until player.hand.cards.size == 5
        player.hand.insert(@deck.deal)
      end
    end
  end

  def print()
    @players.each { |player| @ui.print(player.hand.to_s) }
  end

  def winner()
    winner = nil
    @players.each do |player|
      if winner.nil?
        winner = player
      else
        winner = score(winner) > score(player) ? winner : player
      end
    end
    @ui.print "Winner! #{winner.hand.to_s}"
    winner
  end

  def score(player)
    @evaluator.score(player.hand.cards)
  end
end

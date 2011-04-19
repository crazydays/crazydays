require 'hand'

class Player
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end
end

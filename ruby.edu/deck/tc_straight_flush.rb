require 'straight_flush.rb'
require 'card.rb'
require 'test/unit'

class StraightFlushHand
	attr_accessor :size, :cards
	include StraightFlush

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestStraightFlush < Test::Unit::TestCase
	def test_5_not_full_straight_flush?
		hand = StraightFlushHand.new(5)
		assert_raise(CardCountError) { hand.straight_flush? }
	end


	def test_5_straight_straight_flush?
		hand = StraightFlushHand.new(5)
		hand.cards << Card.new(Suit::SPADE, 1)
		hand.cards << Card.new(Suit::SPADE, 2)
		hand.cards << Card.new(Suit::SPADE, 3)
		hand.cards << Card.new(Suit::HEART, 4)
		hand.cards << Card.new(Suit::SPADE, 5)

		card = hand.straight_flush?

		assert_nil(card)
	end

	def test_5_flush_straight_flush?
		hand = StraightFlushHand.new(5)
		hand.cards << Card.new(Suit::SPADE, 1)
		hand.cards << Card.new(Suit::SPADE, 2)
		hand.cards << Card.new(Suit::SPADE, 3)
		hand.cards << Card.new(Suit::SPADE, 4)
		hand.cards << Card.new(Suit::SPADE, 6)

		card = hand.straight_flush?

		assert_nil(card)
	end


	def test_5_five_straight_flush
		hand = StraightFlushHand.new(5)
		hand.cards << Card.new(Suit::SPADE, 1)
		hand.cards << Card.new(Suit::SPADE, 2)
		hand.cards << Card.new(Suit::SPADE, 3)
		hand.cards << Card.new(Suit::SPADE, 4)
		hand.cards << Card.new(Suit::SPADE, 5)

		card = hand.straight_flush?

		assert_not_nil(card)
		assert_equal(5, card.value)
	end

	def test_7_ace_straight_flush?
		hand = StraightFlushHand.new(7)
		hand.cards << Card.new(Suit::SPADE, 1)
		hand.cards << Card.new(Suit::SPADE, 3)
		hand.cards << Card.new(Suit::SPADE, 4)
		hand.cards << Card.new(Suit::SPADE, 10)
		hand.cards << Card.new(Suit::SPADE, 11)
		hand.cards << Card.new(Suit::SPADE, 12)
		hand.cards << Card.new(Suit::SPADE, 13)

		card = hand.straight_flush?

		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_10_ace_straight_flush?
		hand = StraightFlushHand.new(10)
		hand.cards << Card.new(Suit::HEART, 2)
		hand.cards << Card.new(Suit::HEART, 3)
		hand.cards << Card.new(Suit::HEART, 4)
		hand.cards << Card.new(Suit::HEART, 5)
		hand.cards << Card.new(Suit::HEART, 6)
		hand.cards << Card.new(Suit::SPADE, 9)
		hand.cards << Card.new(Suit::SPADE, 10)
		hand.cards << Card.new(Suit::SPADE, 11)
		hand.cards << Card.new(Suit::SPADE, 12)
		hand.cards << Card.new(Suit::SPADE, 13)

		card = hand.straight_flush?

		assert_not_nil(card)
		assert_equal(13, card.value)
	end
end

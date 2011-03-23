require 'pair.rb'
require 'card.rb'
require 'test/unit'

class PairHand
	attr_accessor :size, :cards
	include Pair

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestPair < Test::Unit::TestCase
	def test_5_not_full_pair?
		hand = PairHand.new(5)
		assert_raise(CardCountError) { hand.pair? }
	end

	def test_aces_5_pair?
		hand = PairHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 1)
		hand.cards[2] = Card.new(Suit::SPADE, 2)
		hand.cards[3] = Card.new(Suit::SPADE, 3)
		hand.cards[4] = Card.new(Suit::SPADE, 4)

		assert_not_nil(hand.pair?)
	end

	def test_aces_7_pair?
		hand = PairHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 1)
		hand.cards[2] = Card.new(Suit::SPADE, 2)
		hand.cards[3] = Card.new(Suit::SPADE, 3)
		hand.cards[4] = Card.new(Suit::HEART, 4)
		hand.cards[5] = Card.new(Suit::HEART, 6)
		hand.cards[6] = Card.new(Suit::SPADE, 7)

		assert_not_nil(hand.pair?)
	end

	def test_start_5_pair?
		hand = PairHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::HEART, 2)
		hand.cards[2] = Card.new(Suit::SPADE, 4)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::SPADE, 8)

		card = hand.pair?
		assert_not_nil(card)
		assert_equal(2, card.value)
	end

	def test_middle_5_pair?
		hand = PairHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 4)
		hand.cards[3] = Card.new(Suit::SPADE, 4)
		hand.cards[4] = Card.new(Suit::SPADE, 8)

		card = hand.pair?
		assert_not_nil(card)
		assert_equal(4, card.value)
	end

	def test_end_5_pair?
		hand = PairHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 4)
		hand.cards[3] = Card.new(Suit::HEART, 8)
		hand.cards[4] = Card.new(Suit::SPADE, 8)

		card = hand.pair?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end

	def test_end_7_pair?
		hand = PairHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 4)
		hand.cards[3] = Card.new(Suit::HEART, 6)
		hand.cards[4] = Card.new(Suit::SPADE, 8)
		hand.cards[5] = Card.new(Suit::CLUB, 12)
		hand.cards[6] = Card.new(Suit::DIAMOND, 12)

		card = hand.pair?
		assert_not_nil(card)
		assert_equal(12, card.value)
	end
end

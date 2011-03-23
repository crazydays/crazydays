require 'two_pair.rb'
require 'card.rb'
require 'test/unit'

class TwoPairHand
	attr_accessor :size, :cards
	include TwoPair

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestPair < Test::Unit::TestCase
	def test_5_not_full_two_pair?
		hand = TwoPairHand.new(5)
		assert_raise(CardCountError) { hand.two_pair? }
	end

	def test_5_no_pairs_two_pair?
		hand = TwoPairHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::DIAMOND, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 4)
		hand.cards[3] = Card.new(Suit::HEART, 5)
		hand.cards[4] = Card.new(Suit::SPADE, 7)

		assert_nil(hand.two_pair?)
	end

	def test_5_deadman_pairs_two_pair?
		hand = TwoPairHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::CLUB, 1)
		hand.cards[2] = Card.new(Suit::CLUB, 8)
		hand.cards[3] = Card.new(Suit::SPADE, 8)
		hand.cards[4] = Card.new(Suit::SPADE, 12)

		card = hand.two_pair?
		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_5_two_and_eight_end_two_pair?
		hand = TwoPairHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::CLUB, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 8)
		hand.cards[3] = Card.new(Suit::SPADE, 8)
		hand.cards[4] = Card.new(Suit::SPADE, 12)

		card = hand.two_pair?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end

	def test_5_two_and_eight_middle_two_pair?
		hand = TwoPairHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 2)
		hand.cards[1] = Card.new(Suit::CLUB, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 6)
		hand.cards[3] = Card.new(Suit::SPADE, 8)
		hand.cards[4] = Card.new(Suit::DIAMOND, 8)

		card = hand.two_pair?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end

	def test_5_two_and_eight_start_two_pair?
		hand = TwoPairHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 2)
		hand.cards[3] = Card.new(Suit::SPADE, 8)
		hand.cards[4] = Card.new(Suit::DIAMOND, 8)

		card = hand.two_pair?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end
end

require 'flush.rb'
require 'card.rb'
require 'test/unit'

class FlushHand
	attr_accessor :size, :cards
	include Flush

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestFlush < Test::Unit::TestCase
	def test_5_not_full_flush?
		hand = FlushHand.new(5)
		assert_raise(CardCountError) { hand.flush? }
	end

	def test_5_not_flush?
		hand = FlushHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 5)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::SPADE, 9)

		assert_nil(hand.flush?)
	end

	def test_5_spades_ace_flush?
		hand = FlushHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::SPADE, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 5)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::SPADE, 9)

		card = hand.flush?
		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_5_spades_jack_flush?
		hand = FlushHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 3)
		hand.cards[1] = Card.new(Suit::SPADE, 5)
		hand.cards[2] = Card.new(Suit::SPADE, 7)
		hand.cards[3] = Card.new(Suit::SPADE, 9)
		hand.cards[4] = Card.new(Suit::SPADE, 11)

		card = hand.flush?
		assert_not_nil(card)
		assert_equal(11, card.value)
	end

	def test_5_spades_king_flush?
		hand = FlushHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 3)
		hand.cards[1] = Card.new(Suit::HEART, 5)
		hand.cards[2] = Card.new(Suit::HEART, 7)
		hand.cards[3] = Card.new(Suit::SPADE, 9)
		hand.cards[4] = Card.new(Suit::SPADE, 11)
		hand.cards[5] = Card.new(Suit::SPADE, 12)
		hand.cards[6] = Card.new(Suit::SPADE, 13)

		card = hand.flush?
		assert_not_nil(card)
		assert_equal(13, card.value)
	end

	def test_cards_by_suit
		hand = FlushHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::SPADE, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 5)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::SPADE, 9)

		suits = hand.cards_by_suit()

		assert_not_nil(suits)
		assert_equal(1, suits.size)
		assert_not_nil(suits[Suit::SPADE])
		assert_equal(1, suits.size)
		assert_equal(Suit::SPADE, suits.keys[0])
		assert_equal(5, suits[Suit::SPADE].size)
	end
end

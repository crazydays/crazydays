require 'four_kind.rb'
require 'card.rb'
require 'test/unit'

class FourKindHand
	attr_accessor :size, :cards
	include FourKind

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestFourKind < Test::Unit::TestCase
	def test_5_not_full_four_of_kind?
		hand = FourKindHand.new(5)
		assert_raise(CardCountError) { hand.four_of_kind? }
	end

	def test_5_not_four_of_kind?
		hand = FourKindHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 1)
		hand.cards[2] = Card.new(Suit::SPADE, 2)
		hand.cards[3] = Card.new(Suit::SPADE, 3)
		hand.cards[4] = Card.new(Suit::SPADE, 4)

		assert_nil(hand.four_of_kind?)
	end

	def test_5_aces_four_of_kind?
		hand = FourKindHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::DIAMOND, 1)
		hand.cards[2] = Card.new(Suit::CLUB, 1)
		hand.cards[3] = Card.new(Suit::HEART, 1)
		hand.cards[4] = Card.new(Suit::SPADE, 4)

		card = hand.four_of_kind?

		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_7_two_four_of_kind?
		hand = FourKindHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 2)
		hand.cards[3] = Card.new(Suit::DIAMOND, 2)
		hand.cards[4] = Card.new(Suit::SPADE, 2)
		hand.cards[5] = Card.new(Suit::HEART, 6)
		hand.cards[6] = Card.new(Suit::SPADE, 7)

		card = hand.four_of_kind?

		assert_not_nil(card)
		assert_equal(2, card.value)
	end

	def test_7_seven_four_of_kind?
		hand = FourKindHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 2)
		hand.cards[2] = Card.new(Suit::CLUB, 2)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::DIAMOND, 7)
		hand.cards[5] = Card.new(Suit::CLUB, 7)
		hand.cards[6] = Card.new(Suit::HEART, 7)

		card = hand.four_of_kind?

		assert_not_nil(card)
		assert_equal(7, card.value)
	end
end

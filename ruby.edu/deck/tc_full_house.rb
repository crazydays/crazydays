require 'full_house.rb'
require 'card.rb'
require 'test/unit'

class FullHouseHand
	attr_accessor :size, :cards
	include FullHouse

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestFullHouse < Test::Unit::TestCase
	def test_5_not_full_full_house?
		hand = FullHouseHand.new(5)
		assert_raise(CardCountError) { hand.full_house? }
	end

	def test_not_5_full_house?
		hand = FullHouseHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::SPADE, 5)
		hand.cards[3] = Card.new(Suit::SPADE, 7)
		hand.cards[4] = Card.new(Suit::SPADE, 9)

		card = hand.full_house?
		assert_nil(card)
	end

	def test_5_ace_three_full_house?
		hand = FullHouseHand.new(5)

		hand.cards[0] = Card.new(Suit::SPADE, 1)
		hand.cards[1] = Card.new(Suit::HEART, 1)
		hand.cards[2] = Card.new(Suit::CLUB, 1)
		hand.cards[3] = Card.new(Suit::SPADE, 3)
		hand.cards[4] = Card.new(Suit::DIAMOND, 3)

		card = hand.full_house?
		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_7_eight_three_full_house?
		hand = FullHouseHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 3)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::CLUB, 4)
		hand.cards[3] = Card.new(Suit::SPADE, 5)
		hand.cards[4] = Card.new(Suit::DIAMOND, 8)
		hand.cards[5] = Card.new(Suit::CLUB, 8)
		hand.cards[6] = Card.new(Suit::SPADE, 8)

		card = hand.full_house?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end

	def test_7_eight_extra_three_full_house?
		hand = FullHouseHand.new(7)

		hand.cards[0] = Card.new(Suit::SPADE, 3)
		hand.cards[1] = Card.new(Suit::HEART, 3)
		hand.cards[2] = Card.new(Suit::CLUB, 3)
		hand.cards[3] = Card.new(Suit::SPADE, 5)
		hand.cards[4] = Card.new(Suit::DIAMOND, 8)
		hand.cards[5] = Card.new(Suit::CLUB, 8)
		hand.cards[6] = Card.new(Suit::SPADE, 8)

		card = hand.full_house?
		assert_not_nil(card)
		assert_equal(8, card.value)
	end
end

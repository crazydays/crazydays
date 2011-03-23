require 'straight.rb'
require 'card.rb'
require 'test/unit'

class StraightHand
	attr_accessor :size, :cards
	include Straight

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestStraight < Test::Unit::TestCase
	def test_5_not_full_straight?
		hand = StraightHand.new(5)
		assert_raise(CardCountError) { hand.straight? }
	end

	def test_5_not_straight?
		hand = StraightHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::DIAMOND, 3);
		hand.cards[2] = Card.new(Suit::CLUB, 5);
		hand.cards[3] = Card.new(Suit::HEART, 7);
		hand.cards[4] = Card.new(Suit::SPADE, 9);

		card = hand.straight?

		assert_nil(card)
	end

	def test_5_ace_five_straight?
		hand = StraightHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::DIAMOND, 2);
		hand.cards[2] = Card.new(Suit::CLUB, 3);
		hand.cards[3] = Card.new(Suit::HEART, 4);
		hand.cards[4] = Card.new(Suit::SPADE, 5);

		card = hand.straight?

		assert_not_nil(card)
		assert_equal(5, card.value)
	end

	def test_5_two_six_straight?
		hand = StraightHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 2);
		hand.cards[1] = Card.new(Suit::DIAMOND, 3);
		hand.cards[2] = Card.new(Suit::CLUB, 4);
		hand.cards[3] = Card.new(Suit::HEART, 5);
		hand.cards[4] = Card.new(Suit::SPADE, 6);

		card = hand.straight?

		assert_not_nil(card)
		assert_equal(6, card.value)
	end

	def test_5_ten_ace_straight?
		hand = StraightHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::DIAMOND, 10);
		hand.cards[2] = Card.new(Suit::CLUB, 11);
		hand.cards[3] = Card.new(Suit::HEART, 12);
		hand.cards[4] = Card.new(Suit::SPADE, 13);

		card = hand.straight?

		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_7_ten_ace_straight?
		hand = StraightHand.new(7)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::DIAMOND, 6);
		hand.cards[2] = Card.new(Suit::DIAMOND, 7);
		hand.cards[3] = Card.new(Suit::DIAMOND, 10);
		hand.cards[4] = Card.new(Suit::CLUB, 11);
		hand.cards[5] = Card.new(Suit::HEART, 12);
		hand.cards[6] = Card.new(Suit::SPADE, 13);

		card = hand.straight?

		assert_not_nil(card)
		assert_equal(1, card.value)
	end
end

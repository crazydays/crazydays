require 'three_kind.rb'
require 'card.rb'
require 'test/unit'

class ThreeKindHand
	attr_accessor :size, :cards
	include ThreeKind

	def initialize(size)
		@size = size
		@cards = Array.new
	end
end

class TestThreeKind < Test::Unit::TestCase
	def test_5_not_full_three_of_kind?
		hand = ThreeKindHand.new(5)
		assert_raise(CardCountError) { hand.three_of_kind? }
	end

	def test_5_no_three_of_kind?
		hand = ThreeKindHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::HEART, 3);
		hand.cards[2] = Card.new(Suit::CLUB, 5);
		hand.cards[3] = Card.new(Suit::DIAMOND, 7);
		hand.cards[4] = Card.new(Suit::SPADE, 9);

		card = hand.three_of_kind?
		assert_nil(card)
	end

	def test_5_first_three_of_kind?
		hand = ThreeKindHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::HEART, 1);
		hand.cards[2] = Card.new(Suit::CLUB, 1);
		hand.cards[3] = Card.new(Suit::DIAMOND, 7);
		hand.cards[4] = Card.new(Suit::SPADE, 9);

		card = hand.three_of_kind?
		assert_not_nil(card)
		assert_equal(1, card.value)
	end

	def test_5_middle_three_of_kind?
		hand = ThreeKindHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::HEART, 5);
		hand.cards[2] = Card.new(Suit::CLUB, 5);
		hand.cards[3] = Card.new(Suit::DIAMOND, 5);
		hand.cards[4] = Card.new(Suit::SPADE, 9);

		card = hand.three_of_kind?
		assert_not_nil(card)
		assert_equal(5, card.value)
	end

	def test_5_end_three_of_kind?
		hand = ThreeKindHand.new(5)
		hand.cards[0] = Card.new(Suit::SPADE, 1);
		hand.cards[1] = Card.new(Suit::HEART, 3);
		hand.cards[2] = Card.new(Suit::CLUB, 5);
		hand.cards[3] = Card.new(Suit::DIAMOND, 5);
		hand.cards[4] = Card.new(Suit::SPADE, 5);

		card = hand.three_of_kind?
		assert_not_nil(card)
		assert_equal(5, card.value)
	end
end

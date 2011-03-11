require 'hand.rb'
require 'card.rb'
require 'test/unit'

class TestHand < Test::Unit::TestCase
	def test_initializer
		hand = Hand.new
		assert_not_nil(hand.cards)
		assert_equal(5, hand.size)

		hand = Hand.new(7)
		assert_not_nil(hand.cards)
		assert_equal(7, hand.size)
	end

	def test_insert
		card = Card.new(Suit::SPADE, 1)
		hand = Hand.new

		hand.insert(card)

		assert_equal(1, hand.cards.length)
		assert(card.eql? hand.cards[0])
	end

	def test_insert_in_order
		c1 = Card.new(Suit::SPADE, 1)
		c2 = Card.new(Suit::SPADE, 2)
		hand = Hand.new

		hand.insert(c1)
		hand.insert(c2)

		assert_equal(2, hand.cards.length)
		assert(c1.eql? hand.cards[0])
		assert(c2.eql? hand.cards[1])
	end

	def test_insert_out_of_order
		c1 = Card.new(Suit::SPADE, 1)
		c2 = Card.new(Suit::SPADE, 2)
		hand = Hand.new

		hand.insert(c2)
		hand.insert(c1)

		assert_equal(2, hand.cards.length)
		assert(c1.eql? hand.cards[0])
		assert(c2.eql? hand.cards[1])
	end

	def test_to_s
		c1 = Card.new(Suit::SPADE, 1)
		c2 = Card.new(Suit::SPADE, 2)
		hand = Hand.new

		hand.insert(c2)
		hand.insert(c1)

		assert_equal("ace of spades, 2 of spades", hand.to_s)		
	end

	def test_straight_flush?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 5))

		assert(hand.straight_flush?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 6))

		assert(! hand.straight_flush?)

		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 5))

		assert(! hand.straight_flush?)
	end

	def test_four_of_kind
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 1))
		hand.insert(Card.new(Suit::CLUB, 1))
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.four_of_kind?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(! hand.four_of_kind?)
	end

	def test_full_house?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))

		assert(hand.full_house?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))

		assert(hand.full_house?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(! hand.full_house?)
	end

	def test_flush?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 6))

		assert(hand.flush?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 1))
		hand.insert(Card.new(Suit::CLUB, 1))
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(! hand.flush?)
	end

	def test_straight?
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 3))
		hand.insert(Card.new(Suit::CLUB, 4))
		hand.insert(Card.new(Suit::SPADE, 5))

		assert(hand.straight?)

		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 10))
		hand.insert(Card.new(Suit::SPADE, 11))
		hand.insert(Card.new(Suit::DIAMOND, 12))
		hand.insert(Card.new(Suit::CLUB, 13))
		hand.insert(Card.new(Suit::SPADE, 1))

		assert(hand.straight?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 1))
		hand.insert(Card.new(Suit::CLUB, 1))
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(! hand.straight?)
	end

	def three_of_kind?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 1))
		hand.insert(Card.new(Suit::CLUB, 1))
		hand.insert(Card.new(Suit::HEART, 2))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.three_of_kind?)
		
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::HEART, 2))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.three_of_kind?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 13))
		hand.insert(Card.new(Suit::HEART, 13))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.three_of_kind?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::HEART, 13))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.three_of_kind?)
	end

	def test_two_pair?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 3))
		hand.insert(Card.new(Suit::HEART, 3))
		hand.insert(Card.new(Suit::SPADE, 13))

		assert(hand.two_pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::HEART, 3))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(hand.two_pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 5))
		hand.insert(Card.new(Suit::HEART, 6))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(! hand.two_pair?)
	end

	def test_pair?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 5))
		hand.insert(Card.new(Suit::HEART, 6))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(hand.pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::HEART, 6))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(hand.pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 3))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::HEART, 6))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(hand.pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 6))
		hand.insert(Card.new(Suit::HEART, 6))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(hand.pair?)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 6))
		hand.insert(Card.new(Suit::HEART, 7))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert(! hand.pair?)
	end
end

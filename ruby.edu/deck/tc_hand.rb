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

	def test_insert_too_many
		hand = Hand.new(1)

		hand.insert(Card.new(Suit::SPADE, 1))
		assert_raise(CardCountError) { hand.insert(Card.new(Suit::SPADE, 2)) }
	end

	def test_discard_no_cards
		hand = Hand.new(5)
		assert_raise(CardCountError) { hand.discard(0) }
	end

	def test_discard_first_card
		hand = Hand.new(5)
		hand.insert(Card.new(Suit::SPADE, 1))

		hand.discard(0)

		assert_equal(0, hand.cards.size)
	end

	def test_discard_second_card
		hand = Hand.new(5)
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::SPADE, 6))

		hand.discard(1)

		assert_equal(4, hand.cards.size)
		assert_equal(4, hand.cards[1].value)
	end

	def test_discard_last_card
		hand = Hand.new(5)
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::SPADE, 6))

		hand.discard(4)

		assert_equal(4, hand.cards.size)
		assert_equal(5, hand.cards[3].value)
	end

	def test_to_s
		c1 = Card.new(Suit::SPADE, 1)
		c2 = Card.new(Suit::SPADE, 2)
		hand = Hand.new

		hand.insert(c2)
		hand.insert(c1)

		assert_equal("ace of spades, 2 of spades", hand.to_s)		
	end

	def test_discard
		hand = Hand.new
	end

	def test_score
		# high card
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 2))
		hand.insert(Card.new(Suit::CLUB, 3))
		hand.insert(Card.new(Suit::DIAMOND, 4))
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::HEART, 7))

		assert_equal(7, hand.score)

		# ace high
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::DIAMOND, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::HEART, 6))

		assert_equal(14, hand.score)

		# pair
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::HEART, 6))

		assert_equal(102, hand.score)

		# two pair
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::SPADE, 8))
		hand.insert(Card.new(Suit::HEART, 8))

		assert_equal(208, hand.score)

		# three of kind
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 1))
		hand.insert(Card.new(Suit::CLUB, 5))
		hand.insert(Card.new(Suit::DIAMOND, 5))
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::HEART, 8))

		assert_equal(305, hand.score)

		# straight
		hand = Hand.new
		hand.insert(Card.new(Suit::HEART, 5))
		hand.insert(Card.new(Suit::CLUB, 6))
		hand.insert(Card.new(Suit::DIAMOND, 7))
		hand.insert(Card.new(Suit::SPADE, 8))
		hand.insert(Card.new(Suit::HEART, 9))

		assert_equal(409, hand.score)

		# flush
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::SPADE, 6))
		hand.insert(Card.new(Suit::SPADE, 7))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 9))

		assert_equal(509, hand.score)

		# full house
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::HEART, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 3))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert_equal(602, hand.score)

		# four of kind
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::HEART, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 2))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert_equal(702, hand.score)

		# straight flush
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::SPADE, 3))
		hand.insert(Card.new(Suit::SPADE, 4))
		hand.insert(Card.new(Suit::SPADE, 5))
		hand.insert(Card.new(Suit::SPADE, 6))

		assert_equal(806, hand.score)
	end

	def test_straight_flush?
		hand = Hand.new(5)
		assert_raise(CardCountError) { hand.straight_flush? }

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
		hand.insert(Card.new(Suit::DIAMOND, 13))
		hand.insert(Card.new(Suit::CLUB, 13))
		hand.insert(Card.new(Suit::HEART, 13))
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

		assert_nil(hand.full_house?)
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

	def test_three_of_kind?
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

		assert(! hand.three_of_kind?)
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
		hand.insert(Card.new(Suit::SPADE, 2))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 3))
		hand.insert(Card.new(Suit::HEART, 13))
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

	def test_high_card?
		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 1))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 6))
		hand.insert(Card.new(Suit::HEART, 7))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert_equal(1, hand.high_card?.value)

		hand = Hand.new
		hand.insert(Card.new(Suit::SPADE, 11))
		hand.insert(Card.new(Suit::DIAMOND, 2))
		hand.insert(Card.new(Suit::CLUB, 6))
		hand.insert(Card.new(Suit::HEART, 7))
		hand.insert(Card.new(Suit::SPADE, 3))

		assert_equal(11, hand.high_card?.value)
	end
end

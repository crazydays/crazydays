require 'hand.rb'
require 'card.rb'
require 'test/unit'

class TestHand < Test::Unit::TestCase
	def test_initializer
		hand = Hand.new
		assert_not_nil(hand.cards)
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
end

require 'deck.rb'
require 'test/unit'

class TestDeck < Test::Unit::TestCase
	def test_constructor
		deck = Deck.new

		assert_equal(       1, deck.cards[ 0].value)
		assert_equal(  :spade, deck.cards[ 0].suit)
		assert_equal(       1, deck.cards[13].value)
		assert_equal(:diamond, deck.cards[13].suit)
		assert_equal(       1, deck.cards[26].value)
		assert_equal(   :club, deck.cards[26].suit)
		assert_equal(       1, deck.cards[39].value)
		assert_equal(  :heart, deck.cards[39].suit)
	end

	def test_shuffle!
		d1 = Deck.new
		d2 = Deck.new
		d2.shuffle!

		assert(! (d1.eql? d2))
	end

	def empty?
		d1 = Deck.new
		assert(! (d1.empty?))
		d1.cards = Array.new
		assert(d1.empty?)
	end

	def deal
		d1 = Deck.new
		c1 = d1.deal
		assert(c1.eql? Card.new(:heart, 13))

		d1.cards = Array.new
		c2 = d1.deal
		assert_nil(c2)
	end

	def test_eql?
		d1 = Deck.new
		d2 = Deck.new

		assert(d1.eql? d2)
	end
end

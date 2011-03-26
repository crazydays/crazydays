require 'card_sort.rb'
require 'deck.rb'
require 'test/unit'

class TestFlush < Test::Unit::TestCase
	def test_by_suit_zero
		cards = Array.new

		result = CardSort.by_suit(cards)

		assert_not_nil(result)
	end

	def test_by_suit_flush
		cards = Array.new
		cards << Card.new(Suit::SPADE, 1)
		cards << Card.new(Suit::SPADE, 3)
		cards << Card.new(Suit::SPADE, 5)
		cards << Card.new(Suit::SPADE, 7)
		cards << Card.new(Suit::SPADE, 9)

		result = CardSort.by_suit(cards)

		assert_not_nil(result)
		assert_equal(1, result.size)
		assert_not_nil(result[Suit::SPADE])
		assert_equal(5, result[Suit::SPADE].size)
	end

	def test_by_suit_random
		cards = Array.new
		cards << Card.new(Suit::SPADE, 1)
		cards << Card.new(Suit::DIAMOND, 3)
		cards << Card.new(Suit::CLUB, 5)
		cards << Card.new(Suit::HEART, 7)

		result = CardSort.by_suit(cards)

		assert_not_nil(result)
		assert_equal(4, result.size)
		assert_not_nil(result[Suit::SPADE])
		assert_equal(1, result[Suit::SPADE].size)
		assert_equal(1, result[Suit::DIAMOND].size)
		assert_equal(1, result[Suit::CLUB].size)
		assert_equal(1, result[Suit::HEART].size)
	end

	def test_by_value_zero
		cards = Array.new

		result = CardSort.by_value(cards)

		assert_not_nil(result)
	end

	def test_by_value_all
		deck = Deck.new

		result = CardSort.by_value(deck.cards)

		assert_not_nil(result)
		assert_equal(13, result.size)

		(1..13).each do |i|
			assert_not_nil(result[i])
			assert_equal(4, result[i].size)
		end
	end

	def test_find_run_ace_to_seven
		cards = Array.new
		cards << Card.new(Suit::SPADE, 1)
		cards << Card.new(Suit::SPADE, 2)
		cards << Card.new(Suit::SPADE, 3)
		cards << Card.new(Suit::SPADE, 4)
		cards << Card.new(Suit::SPADE, 5)
		cards << Card.new(Suit::SPADE, 6)
		cards << Card.new(Suit::SPADE, 7)

		result = CardSort.find_run(CardSort.by_value(cards), 5)

		assert_not_nil(result)
		assert_instance_of(Array, result)
		assert_equal(7, result.size)
	end

	def test_find_run_five_nine
		cards = Array.new
		cards << Card.new(Suit::SPADE, 5)
		cards << Card.new(Suit::SPADE, 6)
		cards << Card.new(Suit::SPADE, 7)
		cards << Card.new(Suit::SPADE, 8)
		cards << Card.new(Suit::SPADE, 9)

		result = CardSort.find_run(CardSort.by_value(cards), 5)

		assert_not_nil(result)
		assert_instance_of(Array, result)
		assert_equal(5, result.size)
	end

	def test_find_run_ten_ace
		cards = Array.new
		cards << Card.new(Suit::SPADE, 1)
		cards << Card.new(Suit::SPADE, 10)
		cards << Card.new(Suit::SPADE, 11)
		cards << Card.new(Suit::SPADE, 12)
		cards << Card.new(Suit::SPADE, 13)

		result = CardSort.find_run(CardSort.by_value(cards), 5)

		assert_not_nil(result)
		assert_instance_of(Array, result)
		assert_equal(5, result.size)
	end
end

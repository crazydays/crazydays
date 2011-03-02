require 'card.rb'
require 'test/unit'

class TestCard < Test::Unit::TestCase
	def test_to_s
		assert_equal('king of spades', Card.new(  :spade, 13).to_s)
		assert_equal( '7 of diamonds', Card.new(:diamond,  7).to_s)
		assert_equal(    '6 of clubs', Card.new(   :club,  6).to_s)
		assert_equal( 'ace of hearts', Card.new(  :heart,  1).to_s)
	end

	def test_value_to_s
		assert_equal( 'king', Card.new(:spade, 13).value_to_s)
		assert_equal('queen', Card.new(:spade, 12).value_to_s)
		assert_equal( 'jack', Card.new(:spade, 11).value_to_s)
		assert_equal(   '10', Card.new(:spade, 10).value_to_s)
		assert_equal(    '9', Card.new(:spade,  9).value_to_s)
		assert_equal(    '8', Card.new(:spade,  8).value_to_s)
		assert_equal(    '7', Card.new(:spade,  7).value_to_s)
		assert_equal(    '6', Card.new(:spade,  6).value_to_s)
		assert_equal(    '5', Card.new(:spade,  5).value_to_s)
		assert_equal(    '4', Card.new(:spade,  4).value_to_s)
		assert_equal(    '3', Card.new(:spade,  3).value_to_s)
		assert_equal(    '2', Card.new(:spade,  2).value_to_s)
		assert_equal(  'ace', Card.new(:spade,  1).value_to_s)
	end

	def test_suit_to_s
		assert_equal(  'spades', Card.new(  :spade, 1).suit_to_s)
		assert_equal('diamonds', Card.new(:diamond, 1).suit_to_s)
		assert_equal(   'clubs', Card.new(   :club, 1).suit_to_s)
		assert_equal(  'hearts', Card.new(  :heart, 1).suit_to_s)
		assert_equal(   'error', Card.new(    :foo, 1).suit_to_s)
	end
end

require 'card.rb'
require 'test/unit'

class TestCard < Test::Unit::TestCase
  def test_initialize
    card = Card.new(Suit::SPADE, 1)
    assert_equal(Suit::SPADE, card.suit)
    assert_equal(1, card.value)

    assert_raise(InvalidCardError) { Card.new(Suit::HEART, -1) }
    assert_raise(InvalidCardError) { Card.new(Suit::HEART, 0) }
    assert_raise(InvalidCardError) { Card.new(Suit::HEART, 14) }
  end

  def test_to_s
    assert_equal('king of spades', Card.new(Suit::SPADE,13).to_s)
    assert_equal( '7 of diamonds', Card.new(Suit::DIAMOND, 7).to_s)
    assert_equal(    '6 of clubs', Card.new(Suit::CLUB, 6).to_s)
    assert_equal( 'ace of hearts', Card.new(Suit::HEART, 1).to_s)
  end

  def test_value_to_s
    assert_equal( 'king', Card.new(Suit::SPADE, 13).value_to_s)
    assert_equal('queen', Card.new(Suit::SPADE, 12).value_to_s)
    assert_equal( 'jack', Card.new(Suit::SPADE, 11).value_to_s)
    assert_equal(   '10', Card.new(Suit::SPADE, 10).value_to_s)
    assert_equal(    '9', Card.new(Suit::SPADE,  9).value_to_s)
    assert_equal(    '8', Card.new(Suit::SPADE,  8).value_to_s)
    assert_equal(    '7', Card.new(Suit::SPADE,  7).value_to_s)
    assert_equal(    '6', Card.new(Suit::SPADE,  6).value_to_s)
    assert_equal(    '5', Card.new(Suit::SPADE,  5).value_to_s)
    assert_equal(    '4', Card.new(Suit::SPADE,  4).value_to_s)
    assert_equal(    '3', Card.new(Suit::SPADE,  3).value_to_s)
    assert_equal(    '2', Card.new(Suit::SPADE,  2).value_to_s)
    assert_equal(  'ace', Card.new(Suit::SPADE,  1).value_to_s)
  end

  def test_suit_to_s
    assert_equal(  'spades', Card.new(Suit::SPADE, 1).suit_to_s)
    assert_equal('diamonds', Card.new(Suit::DIAMOND, 1).suit_to_s)
    assert_equal(   'clubs', Card.new(Suit::CLUB, 1).suit_to_s)
    assert_equal(  'hearts', Card.new(Suit::HEART, 1).suit_to_s)
  end

  def test_eql?
    c1 = Card.new(Suit::SPADE, 1)
    c2 = Card.new(Suit::SPADE, 1)
    c3 = Card.new(Suit::HEART, 1)
    c4 = Card.new(Suit::SPADE, 2)

    assert(c1.eql? c1)
    assert(c1.eql? c2)
    assert(! (c1.eql? c3))
    assert(! (c1.eql? c4))
  end
end

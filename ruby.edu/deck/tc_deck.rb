require 'deck.rb'
require 'test/unit'

class TestDeck < Test::Unit::TestCase
  def test_constructor
    deck = Deck.new

    assert_equal(            1, deck.cards[ 0].value)
    assert_equal(  Suit::SPADE, deck.cards[ 0].suit)
    assert_equal(            1, deck.cards[13].value)
    assert_equal(Suit::DIAMOND, deck.cards[13].suit)
    assert_equal(            1, deck.cards[26].value)
    assert_equal(   Suit::CLUB, deck.cards[26].suit)
    assert_equal(            1, deck.cards[39].value)
    assert_equal(  Suit::HEART, deck.cards[39].suit)
  end

  def test_shuffle!
    d1 = Deck.new
    d2 = Deck.new
    d2.shuffle!

    assert(! (d1.eql? d2))
  end

  def test_empty?
    d1 = Deck.new
    assert(! (d1.empty?))
    d1.cards = Array.new
    assert(d1.empty?)
  end

  def test_deal
    d1 = Deck.new
    c1 = d1.deal
    assert(c1.eql? Card.new(Suit::HEART, 13))

    d1.cards = Array.new
    assert_raise(OutOfCards) { d1.deal }
  end

  def test_eql?
    d1 = Deck.new
    d2 = Deck.new

    assert(d1.eql? d2)
  end
end

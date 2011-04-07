require 'flush.rb'
require 'card.rb'
require 'test/unit'

class TestFlush < Test::Unit::TestCase
  def test_match_no_cards()
    cards = Array.new

    result = Flush.match?(cards)

    assert_nil(result)
  end

  def test_match_not_flush()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::HEART, 7)
    cards << Card.new(Suit::SPADE, 9)

    result = Flush.match?(cards)

    assert_nil(result)
  end

  def test_match_spades()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)

    result = Flush.match?(cards)

    assert_not_nil(result)
    assert_equal(5, result.size)
    assert_equal(1, result[0].value)
    assert_equal(9, result[1].value)
    assert_equal(7, result[2].value)
    assert_equal(5, result[3].value)
    assert_equal(3, result[4].value)
  end

  def test_match_spades_six()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)

    result = Flush.match?(cards)

    assert_not_nil(result)
    assert_equal(5, result.size)
    assert_equal(1, result[0].value)
    assert_equal(9, result[1].value)
    assert_equal(7, result[2].value)
    assert_equal(5, result[3].value)
    assert_equal(3, result[4].value)
  end

  def test_score
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)
    match = Flush.match?(cards)

    result = Flush.score(cards, match)

    assert_equal(5740778, result)
  end
end

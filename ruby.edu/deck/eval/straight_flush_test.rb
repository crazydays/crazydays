require 'eval/straight_flush'
require 'card'
require 'test/unit'

class TestStraightFlush < Test::Unit::TestCase
  def test_match_no_cards()
    cards = Array.new

    result = StraightFlush.match?(cards)

    assert_nil(result)
  end

  def test_match_nothing()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::HEART, 6)
    cards << Card.new(Suit::SPADE, 7)

    result = StraightFlush.match?(cards)

    assert_nil(result)
  end

  def test_match_straight()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 6)

    result = StraightFlush.match?(cards)

    assert_nil(result)
  end

  def test_match_flush()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::SPADE, 8)
    cards << Card.new(Suit::SPADE, 10)

    result = StraightFlush.match?(cards)

    assert_nil(result)
  end

  def test_match_straight_flush()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 6)

    result = StraightFlush.match?(cards)

    assert_not_nil(result)
    assert_equal(5, result.size)
  end

  def test_score()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 6)
    match = StraightFlush.match?(cards)

    result = StraightFlush.score(cards, match)
    assert_equal(8303750, result)
  end
end

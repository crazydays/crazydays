require 'straight'
require 'card'
require 'test/unit'

class TestStraight < Test::Unit::TestCase
  def test_match_not_straight
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::HEART, 7)
    cards << Card.new(Suit::SPADE, 9)

    result = Straight.match?(cards)

    assert_nil(result)
  end

  def test_match_low
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 2)
    cards << Card.new(Suit::CLUB, 3)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::SPADE, 5)

    result = Straight.match?(cards)

    assert_not_nil(result)
    assert_equal(1, result.first.value)
    assert_equal(5, result.last.value)
  end

  def test_match_middle
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 4)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 6)

    result = Straight.match?(cards)

    assert_not_nil(result)
    assert_equal(2, result.first.value)
    assert_equal(6, result.last.value)
  end

  def test_match_high
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 10)
    cards << Card.new(Suit::CLUB, 11)
    cards << Card.new(Suit::HEART, 12)
    cards << Card.new(Suit::SPADE, 13)

    result = Straight.match?(cards)

    assert_not_nil(result)
    assert_equal(10, result.first.value)
    assert_equal(1, result.last.value)
  end

  def test_score_low
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 2)
    cards << Card.new(Suit::CLUB, 3)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::SPADE, 5)
    match = Straight.match?(cards)

    result = Straight.score(cards, match)

    assert_equal(4253125, result)
  end

  def test_score_middle
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 4)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 6)
    match = Straight.match?(cards)

    result = Straight.score(cards, match)

    assert_equal(4303750, result)
  end

  def test_score_high
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 10)
    cards << Card.new(Suit::CLUB, 11)
    cards << Card.new(Suit::HEART, 12)
    cards << Card.new(Suit::SPADE, 13)
    match = Straight.match?(cards)

    result = Straight.score(cards, match)

    assert_equal(4708750, result)
  end
end

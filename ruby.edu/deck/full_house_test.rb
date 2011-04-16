require 'full_house'
require 'card'
require 'test/unit'

class TestFullHouse < Test::Unit::TestCase
  def test_match_no_cards()
    cards = Array.new

    result = FullHouse.match?(cards)

    assert_nil(result)
  end

  def test_match_not_fullhouse()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 6)

    result = FullHouse.match?(cards)

    assert_nil(result)
  end

  def test_match_fullhouse_3_6()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 6)

    result = FullHouse.match?(cards)

    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(3, result[0][0].value)
    assert_equal(3, result[0][1].value)
    assert_equal(3, result[0][2].value)
    assert_equal(6, result[1][0].value)
    assert_equal(6, result[1][1].value)
  end

  def test_score
    cards = Array.new
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 6)
    match = FullHouse.match?(cards)

    result = FullHouse.score(cards, match)

    assert_equal(6151965, result)
  end
end

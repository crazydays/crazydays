require 'high_card.rb'
require 'test/unit'

class TestHighCard < Test::Unit::TestCase
  def test_high_card_ace
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 9)
    cards << Card.new(Suit::SPADE, 12)

    result = HighCard.match?(cards)

    assert_not_nil(result)
    assert_equal(5, result.size)
    assert_equal(1, result[0].value)
    assert_equal(12, result[1].value)
    assert_equal(9, result[2].value)
    assert_equal(6, result[3].value)
    assert_equal(3, result[4].value)
  end

  def test_high_card_no_ace
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 9)
    cards << Card.new(Suit::SPADE, 12)

    result = HighCard.match?(cards)

    assert_not_nil(result)
    assert_equal(5, result.size)
    assert_equal(12, result[0].value)
    assert_equal(9, result[1].value)
    assert_equal(6, result[2].value)
    assert_equal(3, result[3].value)
    assert_equal(2, result[4].value)
  end

  def test_score_ace
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 9)
    cards << Card.new(Suit::SPADE, 12)

    result = HighCard.score(cards)

    assert_equal(751368, result)
  end
end

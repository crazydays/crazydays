require 'four_kind'
require 'card'
require 'test/unit'

class TestFourKind < Test::Unit::TestCase
  def test_match_no_cards
    cards = Array.new()

    result = FourKind.match?(cards)
    assert_nil(result)
  end

  def test_match_hand_four_aces
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)
    cards << Card.new(Suit::DIAMOND, 1)
    cards << Card.new(Suit::CLUB, 1)
    cards << Card.new(Suit::SPADE, 4)

    result = FourKind.match?(cards)

    assert_not_nil(result)
    assert_equal(4, result.size)
    assert_equal(1, result[0].value)
    assert_equal(1, result[1].value)
    assert_equal(1, result[2].value)
    assert_equal(1, result[3].value)
  end

  def test_match_hand_four_kings
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)
    cards << Card.new(Suit::CLUB, 13)
    cards << Card.new(Suit::DIAMOND, 13)

    result = FourKind.match?(cards)

    assert_not_nil(result)
    assert_equal(4, result.size)
    assert_equal(13, result[0].value)
    assert_equal(13, result[1].value)
    assert_equal(13, result[2].value)
    assert_equal(13, result[3].value)
  end

  def test_score
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)
    match = FourKind.match?(cards)
    
    result = FourKind.score(cards, match)

    assert_equal(7658127, result)
  end

end

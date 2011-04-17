require 'eval/three_kind'
require 'card'
require 'test/unit'

class TestThreeKind < Test::Unit::TestCase
  def test_match_no_cards
    cards = Array.new

    results = ThreeKind.match?(cards)

    assert_nil(results)
  end

  def test_match_no_triplet
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::HEART, 7)
    cards << Card.new(Suit::SPADE, 9)

    results = ThreeKind.match?(cards)

    assert_nil(results)
  end

  def test_match_triplet
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 9)
    cards << Card.new(Suit::HEART, 9)
    cards << Card.new(Suit::SPADE, 9)

    results = ThreeKind.match?(cards)

    assert_not_nil(results)
    assert_equal(9, results[0].value)
    assert_equal(9, results[1].value)
    assert_equal(9, results[2].value)
  end

  def test_score_nines
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 9)
    cards << Card.new(Suit::HEART, 9)
    cards << Card.new(Suit::SPADE, 9)
    match = ThreeKind.match?(cards)

    result = ThreeKind.score(cards, match)

    assert_equal(3455838, result)
  end
end

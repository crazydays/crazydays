require 'poker_eval'
require 'test/unit'

class TestPokerEvaluator < Test::Unit::TestCase
  def test_score_high_card()
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 8)

    result = PokerEvaluator.new().score(cards)

    assert_equal(737420, result)
  end

  def test_score_pair()
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 8)

    result = PokerEvaluator.new().score(cards)

    assert_equal(1256402, result)
  end

  def test_score_two_pair()
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::HEART, 8)
    cards << Card.new(Suit::SPADE, 8)

    result = PokerEvaluator.new().score(cards)

    assert_equal(2710555, result)
  end

  def test_score_three_kind
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::SPADE, 8)

    result = PokerEvaluator.new().score(cards)

    assert_equal(3253343, result)
  end

  def test_score_straight
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::SPADE, 6)

    result = PokerEvaluator.new().score(cards)

    assert_equal(4303750, result)
  end

  def test_score_flush()
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)
    cards << Card.new(Suit::SPADE, 11)

    result = PokerEvaluator.new().score(cards)

    assert_equal(5588903, result)
  end

  def test_score_full_house()
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 6)

    result = PokerEvaluator.new().score(cards)

    assert_equal(6151965, result)
  end

  def test_score_four_kind()
    cards = Array.new()
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 13)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::DIAMOND, 13)
    cards << Card.new(Suit::SPADE, 13)

    result = PokerEvaluator.new().score(cards)

    assert_equal(7658127, result)
  end

  def test_score_straight_flush()
    cards = Array.new()
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::HEART, 5)
    cards << Card.new(Suit::HEART, 6)

    result = PokerEvaluator.new().score(cards)

    assert_equal(8303750, result)
  end
end

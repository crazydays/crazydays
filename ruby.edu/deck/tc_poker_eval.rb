require 'poker_eval.rb'
require 'test/unit'

class TestPokerEvaluator < Test::Unit::TestCase
  def test_initialize
    hand = Hand.new
    evaluator = PokerEvaluator.new(hand)

    assert_equal(hand, evaluator.hand)
  end

  def test_score_high_card
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 1))
    hand.insert(Card.new(Suit::HEART, 5))
    hand.insert(Card.new(Suit::SPADE, 6))
    hand.insert(Card.new(Suit::SPADE, 7))
    hand.insert(Card.new(Suit::SPADE, 8))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(737420, result)
  end

  def test_score_pair
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 1))
    hand.insert(Card.new(Suit::HEART, 5))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::SPADE, 7))
    hand.insert(Card.new(Suit::SPADE, 8))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(1256402, result)
  end

  def test_score_two_pair
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 1))
    hand.insert(Card.new(Suit::HEART, 1))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::HEART, 8))
    hand.insert(Card.new(Suit::SPADE, 8))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(2710555, result)
  end

  def test_score_three_kind
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 1))
    hand.insert(Card.new(Suit::HEART, 5))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::CLUB, 5))
    hand.insert(Card.new(Suit::SPADE, 8))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(3253343, result)
  end

  def test_score_straight
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 2))
    hand.insert(Card.new(Suit::HEART, 3))
    hand.insert(Card.new(Suit::SPADE, 4))
    hand.insert(Card.new(Suit::CLUB, 5))
    hand.insert(Card.new(Suit::SPADE, 6))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(4303750, result)
  end

  def test_score_flush()
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 3))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::SPADE, 7))
    hand.insert(Card.new(Suit::SPADE, 9))
    hand.insert(Card.new(Suit::SPADE, 11))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(5588903, result)
  end

  def test_score_full_house()
    hand = Hand.new
    hand.insert(Card.new(Suit::SPADE, 3))
    hand.insert(Card.new(Suit::HEART, 3))
    hand.insert(Card.new(Suit::DIAMOND, 3))
    hand.insert(Card.new(Suit::SPADE, 6))
    hand.insert(Card.new(Suit::HEART, 6))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(6151965, result)
  end

  def test_score_four_kind()
    hand = Hand.new
    hand.insert(Card.new(Suit::HEART, 2))
    hand.insert(Card.new(Suit::SPADE, 13))
    hand.insert(Card.new(Suit::HEART, 13))
    hand.insert(Card.new(Suit::DIAMOND, 13))
    hand.insert(Card.new(Suit::SPADE, 13))
    evaluator = PokerEvaluator.new(hand)

    result = evaluator.score()

    assert_equal(7658127, result)
  end
end

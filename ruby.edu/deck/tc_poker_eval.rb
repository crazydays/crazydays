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

    assert_equal(265, result)
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

    assert_equal(1199, result)
  end
end

require 'poker_eval.rb'
require 'test/unit'

class TestPokerEvaluator < Test::Unit::TestCase
  def test_initialize
    hand = Hand.new
    evaluator = PokerEvaluator.new(hand)

    assert_equal(hand, evaluator.hand)
  end
  
  def test_high_card_no_cards
    hand = Hand.new

    evaluator = PokerEvaluator.new(hand)

    cards = evaluator.high_card()
    
    assert_not_nil(cards)
  end

  def test_high_card_ace
    hand = Hand.new
    hand.cards << Card.new(Suit::SPADE, 1)
    hand.cards << Card.new(Suit::DIAMOND, 3)
    hand.cards << Card.new(Suit::CLUB, 5)
    hand.cards << Card.new(Suit::HEART, 7)
    hand.cards << Card.new(Suit::SPADE, 13)

    evaluator = PokerEvaluator.new(hand)

    cards = evaluator.high_card()
    
    assert_not_nil(cards)
    assert_equal(5, cards.size)
    assert_equal(1, cards[0].value)
    assert_equal(13, cards[1].value)
    assert_equal(7, cards[2].value)
    assert_equal(5, cards[3].value)
    assert_equal(3, cards[4].value)
  end

  def test_high_card_king
    hand = Hand.new
    hand.cards << Card.new(Suit::SPADE, 2)
    hand.cards << Card.new(Suit::DIAMOND, 3)
    hand.cards << Card.new(Suit::CLUB, 5)
    hand.cards << Card.new(Suit::HEART, 7)
    hand.cards << Card.new(Suit::SPADE, 13)

    evaluator = PokerEvaluator.new(hand)

    cards = evaluator.high_card()
    
    assert_not_nil(cards)
    assert_equal(5, cards.size)
    assert_equal(13, cards[0].value)
    assert_equal(7, cards[1].value)
    assert_equal(5, cards[2].value)
    assert_equal(3, cards[3].value)
    assert_equal(2, cards[4].value)
  end
end

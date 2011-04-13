require 'pair.rb'
require 'test/unit'

class TestPair < Test::Unit::TestCase
  def test_match_no_cards
    cards = Array.new()
    
    result = Pair.match?(cards)
    assert_nil(result)
  end

  def test_match_only_pair_aces
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)
    
    result = Pair.match?(cards)
    
    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(1, result[0].value)
    assert_equal(1, result[1].value)
  end

  def test_match_hand_pair_aces
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 3)
    cards << Card.new(Suit::SPADE, 4)

    result = Pair.match?(cards)
    
    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(1, result[0].value)
    assert_equal(1, result[1].value)
  end

  def test_match_hand_pair_kings
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)

    result = Pair.match?(cards)
    
    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(13, result[0].value)
    assert_equal(13, result[1].value)
  end

  def test_score
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)

    result = Pair.score(cards, Pair.match?(cards))

    assert_equal(1659537, result)
  end
end

require 'two_pair.rb'
require 'test/unit'

class TestPair < Test::Unit::TestCase
  def test_match_no_cards
    cards = Array.new

    result = TwoPair.match?(cards)

    assert_nil(result);
  end

  def test_match_no_pair
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 4)
    cards << Card.new(Suit::CLUB, 6)
    cards << Card.new(Suit::HEART, 8)
    cards << Card.new(Suit::SPADE, 10)

    result = TwoPair.match?(cards)

    assert_nil(result);
  end

  def test_match_one_pair
    cards = Array.new
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::DIAMOND, 4)
    cards << Card.new(Suit::CLUB, 6)
    cards << Card.new(Suit::HEART, 8)
    cards << Card.new(Suit::SPADE, 10)

    result = TwoPair.match?(cards)

    assert_nil(result);
  end

  def test_match_two_pair_0_2
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 2)
    cards << Card.new(Suit::CLUB, 4)
    cards << Card.new(Suit::HEART, 4)
    cards << Card.new(Suit::SPADE, 10)

    result = TwoPair.match?(cards)

    assert_not_nil(result);
    assert_equal(2, result.size)
    assert_equal(4, result[0][0].value)
    assert_equal(4, result[0][1].value)
    assert_equal(2, result[1][0].value)
    assert_equal(2, result[1][1].value)
  end

  def test_match_two_pair_0_3
    cards = Array.new
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::CLUB, 4)
    cards << Card.new(Suit::HEART, 4)

    result = TwoPair.match?(cards)

    assert_not_nil(result);
    assert_equal(2, result.size)
    assert_equal(4, result[0][0].value)
    assert_equal(4, result[0][1].value)
    assert_equal(2, result[1][0].value)
    assert_equal(2, result[1][1].value)
  end

  def test_match_two_pair_1_3
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::DIAMOND, 2)
    cards << Card.new(Suit::CLUB, 4)
    cards << Card.new(Suit::HEART, 4)

    result = TwoPair.match?(cards)

    assert_not_nil(result);
    assert_equal(2, result.size)
    assert_equal(4, result[0][0].value)
    assert_equal(4, result[0][1].value)
    assert_equal(2, result[1][0].value)
    assert_equal(2, result[1][1].value)
  end

  def test_score_2_13
    cards = Array.new()
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::HEART, 13)
    cards << Card.new(Suit::SPADE, 13)

    result = TwoPair.score(cards, TwoPair.match?(cards))

    assert_equal(2156, result)
  end
end

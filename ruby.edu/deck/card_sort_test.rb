require 'card_sort.rb'
require 'deck.rb'
require 'test/unit'

class TestFlush < Test::Unit::TestCase
  def test_by_suit_zero
    cards = Array.new

    result = CardSort.by_suit(cards)

    assert_not_nil(result)
  end

  def test_by_suit_flush
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)

    result = CardSort.by_suit(cards)

    assert_not_nil(result)
    assert_equal(1, result.size)
    assert_not_nil(result[Suit::SPADE])
    assert_equal(5, result[Suit::SPADE].size)
  end

  def test_by_suit_random
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::DIAMOND, 3)
    cards << Card.new(Suit::CLUB, 5)
    cards << Card.new(Suit::HEART, 7)

    result = CardSort.by_suit(cards)

    assert_not_nil(result)
    assert_equal(4, result.size)
    assert_not_nil(result[Suit::SPADE])
    assert_equal(1, result[Suit::SPADE].size)
    assert_equal(1, result[Suit::DIAMOND].size)
    assert_equal(1, result[Suit::CLUB].size)
    assert_equal(1, result[Suit::HEART].size)
  end

  def test_by_value_zero
    cards = Array.new

    result = CardSort.by_value(cards)

    assert_not_nil(result)
  end

  def test_by_value_all
    deck = Deck.new

    result = CardSort.by_value(deck.cards)

    assert_not_nil(result)
    assert_equal(13, result.size)

    (1..13).each do |i|
      assert_not_nil(result[i])
      assert_equal(4, result[i].size)
    end
  end

  def test_find_match_pair_no_cards
    cards = Array.new

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_nil(result)
  end

  def test_find_match_pair_no_pairs
    cards = Array.new

    result = CardSort.find_match(CardSort.by_value(cards), 2)
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 9)

    assert_nil(result)
  end

  def test_find_match_pair
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_not_nil(result)
    assert_equal(2, result.size)
  end

  def test_find_match_pair_aces
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(1, result[0].value)
  end

  def test_find_match_pair_tens
    cards = Array.new
    cards << Card.new(Suit::SPADE, 10)
    cards << Card.new(Suit::HEART, 10)

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(10, result[0].value)
  end

  def test_find_match_pair_tens_extra_cards
    cards = Array.new
    cards << Card.new(Suit::SPADE, 9)
    cards << Card.new(Suit::SPADE, 10)
    cards << Card.new(Suit::HEART, 10)
    cards << Card.new(Suit::SPADE, 11)

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(10, result[0].value)
  end

  def test_find_match_pair_twos
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 11)

    result = CardSort.find_match(CardSort.by_value(cards), 2)

    assert_not_nil(result)
    assert_equal(2, result.size)
    assert_equal(2, result[0].value)
  end

  def test_find_run_ace_to_seven
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 4)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::SPADE, 7)

    result = CardSort.find_run(CardSort.by_value(cards), 5)

    assert_not_nil(result)
    assert_instance_of(Array, result)
    assert_equal(7, result.size)
  end

  def test_find_run_five_nine
    cards = Array.new
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 6)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 8)
    cards << Card.new(Suit::SPADE, 9)

    result = CardSort.find_run(CardSort.by_value(cards), 5)

    assert_not_nil(result)
    assert_instance_of(Array, result)
    assert_equal(5, result.size)
  end

  def test_find_run_ten_ace
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::SPADE, 10)
    cards << Card.new(Suit::SPADE, 11)
    cards << Card.new(Suit::SPADE, 12)
    cards << Card.new(Suit::SPADE, 13)

    result = CardSort.find_run(CardSort.by_value(cards), 5)

    assert_not_nil(result)
    assert_instance_of(Array, result)
    assert_equal(5, result.size)
  end

  def test_remainder()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 1)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)

    result = CardSort.remainder(cards, [cards[0], cards[1]])

    assert_not_nil(result)
    assert_equal(3, result.size)
  end

  def test_score_with_ace()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 1)
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)

    result = CardSort.score_cards(cards)

    assert_equal(733547, result)
  end

  def test_score_without_ace()
    cards = Array.new
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 10)

    result = CardSort.score_cards(cards)

    assert_equal(531047, result)
  end

  def test_score_without_ace_six_cards()
    cards = Array.new
    cards << Card.new(Suit::HEART, 2)
    cards << Card.new(Suit::SPADE, 3)
    cards << Card.new(Suit::SPADE, 5)
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 10)
    cards << Card.new(Suit::SPADE, 11)

    result = CardSort.score_cards(cards)

    assert_equal(592278, result)
  end

  def test_score_without_ace_three_cards()
    cards = Array.new
    cards << Card.new(Suit::SPADE, 7)
    cards << Card.new(Suit::SPADE, 10)
    cards << Card.new(Suit::SPADE, 11)

    result = CardSort.score_cards(cards)

    assert_equal(2632, result)
  end
end


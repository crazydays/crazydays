require 'hand.rb'
require 'card.rb'
require 'test/unit'

class TestHand < Test::Unit::TestCase
  def test_initializer
    hand = Hand.new
    assert_not_nil(hand.cards)
    assert_equal(5, hand.size)

    hand = Hand.new(7)
    assert_not_nil(hand.cards)
    assert_equal(7, hand.size)
  end

  def test_insert
    card = Card.new(Suit::SPADE, 1)
    hand = Hand.new

    hand.insert(card)

    assert_equal(1, hand.cards.length)
    assert(card.eql? hand.cards[0])
  end

  def test_insert_in_order
    c1 = Card.new(Suit::SPADE, 1)
    c2 = Card.new(Suit::SPADE, 2)
    hand = Hand.new

    hand.insert(c1)
    hand.insert(c2)

    assert_equal(2, hand.cards.length)
    assert(c1.eql? hand.cards[0])
    assert(c2.eql? hand.cards[1])
  end

  def test_insert_out_of_order
    c1 = Card.new(Suit::SPADE, 1)
    c2 = Card.new(Suit::SPADE, 2)
    hand = Hand.new

    hand.insert(c2)
    hand.insert(c1)

    assert_equal(2, hand.cards.length)
    assert(c1.eql? hand.cards[0])
    assert(c2.eql? hand.cards[1])
  end

  def test_insert_too_many
    hand = Hand.new(1)

    hand.insert(Card.new(Suit::SPADE, 1))
    assert_raise(CardCountError) { hand.insert(Card.new(Suit::SPADE, 2)) }
  end

  def test_discard_first_card
    hand = Hand.new(5)
    hand.insert(Card.new(Suit::SPADE, 1))

    hand.discard(0)

    assert_equal(0, hand.cards.size)
  end

  def test_discard_second_card
    hand = Hand.new(5)
    hand.insert(Card.new(Suit::SPADE, 2))
    hand.insert(Card.new(Suit::SPADE, 3))
    hand.insert(Card.new(Suit::SPADE, 4))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::SPADE, 6))

    hand.discard(1)

    assert_equal(4, hand.cards.size)
    assert_equal(4, hand.cards[1].value)
  end

  def test_discard_last_card()
    hand = Hand.new(5)
    hand.insert(Card.new(Suit::SPADE, 2))
    hand.insert(Card.new(Suit::SPADE, 3))
    hand.insert(Card.new(Suit::SPADE, 4))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::SPADE, 6))

    hand.discard(4)

    assert_equal(4, hand.cards.size)
    assert_equal(2, hand.cards[0].value)
    assert_equal(3, hand.cards[1].value)
    assert_equal(4, hand.cards[2].value)
    assert_equal(5, hand.cards[3].value)
  end

  def test_discard_multiple()
    hand = Hand.new(5)
    hand.insert(Card.new(Suit::SPADE, 2))
    hand.insert(Card.new(Suit::SPADE, 3))
    hand.insert(Card.new(Suit::SPADE, 4))
    hand.insert(Card.new(Suit::SPADE, 5))
    hand.insert(Card.new(Suit::SPADE, 6))

    hand.discard([2, 3])

    assert_equal(3, hand.cards.size)
    assert_equal(2, hand.cards[0].value)
    assert_equal(3, hand.cards[1].value)
    assert_equal(6, hand.cards[2].value)
  end

  def test_to_s
    c1 = Card.new(Suit::SPADE, 1)
    c2 = Card.new(Suit::SPADE, 2)
    hand = Hand.new

    hand.insert(c2)
    hand.insert(c1)

    assert_equal("ace of spades, 2 of spades", hand.to_s)
  end
end

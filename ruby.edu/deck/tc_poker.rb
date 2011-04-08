require 'ui.rb'
require 'suit.rb'
require 'card.rb'
require 'poker.rb'
require 'test/unit'
require 'mocha'

class TestHand < Test::Unit::TestCase
  def test_initialize
    poker = Poker.new
    assert_equal(5, poker.players)

    poker = Poker.new(UI.new, 7)
    assert_equal(7, poker.players)
  end

  def test_shuffle
    poker = Poker.new

    poker.shuffle
    assert_equal(52, poker.deck.cards.size)

    poker.deck.deal
    poker.shuffle
    assert_equal(52, poker.deck.cards.size)
  end

  def test_deal
    poker = Poker.new
    poker.shuffle
    poker.deal

    assert_equal(27, poker.deck.cards.size)
    (1..5).each do |i|
      assert_equal(5, poker.hands[i].cards.size)
    end
  end

  def test_discard_prime
    ui = mock()
    ui.expects(:print).with('ace of spades, 2 of spades, 4 of hearts, 5 of hearts, 6 of hearts').returns('')
    ui.expects(:prompt).with('Discard?').returns('0,1')
    poker = Poker.new(ui, 1)
    poker.shuffle
    poker.deal
    poker.hands[1].cards[0] = Card.new(Suit::SPADE, 1)
    poker.hands[1].cards[1] = Card.new(Suit::SPADE, 2)
    poker.hands[1].cards[2] = Card.new(Suit::HEART, 4)
    poker.hands[1].cards[3] = Card.new(Suit::HEART, 5)
    poker.hands[1].cards[4] = Card.new(Suit::HEART, 6)

    poker.discard

    assert_equal(3, poker.hands[1].cards.size)
  end

  def test_redeal
    poker = Poker.new
    poker.shuffle
    poker.deal

    (1..poker.players).each do |i|
      poker.hands[i].discard(0)
    end

    poker.redeal

    assert_equal(22, poker.deck.cards.size)
    (1..5).each do |i|
      assert_equal(5, poker.hands[i].cards.size)
    end
  end

  def test_print
    ui = mock()
    ui.expects(:print).with('ace of spades, 2 of spades, 4 of hearts, 5 of hearts, 6 of hearts').returns('')
    ui.expects(:print).with('5 of spades, 6 of spades, 7 of hearts, 8 of hearts, 9 of hearts').returns('')

    poker = Poker.new(ui, 2)
    poker.shuffle
    poker.deal
    poker.hands[1].cards[0] = Card.new(Suit::SPADE, 1)
    poker.hands[1].cards[1] = Card.new(Suit::SPADE, 2)
    poker.hands[1].cards[2] = Card.new(Suit::HEART, 4)
    poker.hands[1].cards[3] = Card.new(Suit::HEART, 5)
    poker.hands[1].cards[4] = Card.new(Suit::HEART, 6)
    poker.hands[2].cards[0] = Card.new(Suit::SPADE, 5)
    poker.hands[2].cards[1] = Card.new(Suit::SPADE, 6)
    poker.hands[2].cards[2] = Card.new(Suit::HEART, 7)
    poker.hands[2].cards[3] = Card.new(Suit::HEART, 8)
    poker.hands[2].cards[4] = Card.new(Suit::HEART, 9)

    poker.print
  end

  def test_winner
    # first
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.hands[1].cards[0] = Card.new(Suit::SPADE, 1)
    poker.hands[1].cards[1] = Card.new(Suit::SPADE, 10)
    poker.hands[1].cards[2] = Card.new(Suit::SPADE, 11)
    poker.hands[1].cards[3] = Card.new(Suit::SPADE, 12)
    poker.hands[1].cards[4] = Card.new(Suit::SPADE, 13)
    poker.hands[2].cards[0] = Card.new(Suit::HEART, 1)
    poker.hands[2].cards[1] = Card.new(Suit::CLUB, 3)
    poker.hands[2].cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.hands[2].cards[3] = Card.new(Suit::SPADE, 7)
    poker.hands[2].cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.hands[3].cards[0] = Card.new(Suit::HEART, 2)
    poker.hands[3].cards[1] = Card.new(Suit::CLUB, 4)
    poker.hands[3].cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.hands[3].cards[3] = Card.new(Suit::SPADE, 8)
    poker.hands[3].cards[4] = Card.new(Suit::DIAMOND, 10)

    result = poker.winner

    assert_equal(poker.hands[1], result)

    # middle
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.hands[1].cards[0] = Card.new(Suit::HEART, 1)
    poker.hands[1].cards[1] = Card.new(Suit::CLUB, 3)
    poker.hands[1].cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.hands[1].cards[3] = Card.new(Suit::SPADE, 7)
    poker.hands[1].cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.hands[2].cards[0] = Card.new(Suit::SPADE, 1)
    poker.hands[2].cards[1] = Card.new(Suit::SPADE, 10)
    poker.hands[2].cards[2] = Card.new(Suit::SPADE, 11)
    poker.hands[2].cards[3] = Card.new(Suit::SPADE, 12)
    poker.hands[2].cards[4] = Card.new(Suit::SPADE, 13)
    poker.hands[3].cards[0] = Card.new(Suit::HEART, 2)
    poker.hands[3].cards[1] = Card.new(Suit::CLUB, 4)
    poker.hands[3].cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.hands[3].cards[3] = Card.new(Suit::SPADE, 8)
    poker.hands[3].cards[4] = Card.new(Suit::DIAMOND, 10)

    result = poker.winner

    assert_equal(poker.hands[2], result)

    # last
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.hands[1].cards[0] = Card.new(Suit::HEART, 1)
    poker.hands[1].cards[1] = Card.new(Suit::CLUB, 3)
    poker.hands[1].cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.hands[1].cards[3] = Card.new(Suit::SPADE, 7)
    poker.hands[1].cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.hands[2].cards[0] = Card.new(Suit::HEART, 2)
    poker.hands[2].cards[1] = Card.new(Suit::CLUB, 4)
    poker.hands[2].cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.hands[2].cards[3] = Card.new(Suit::SPADE, 8)
    poker.hands[2].cards[4] = Card.new(Suit::DIAMOND, 10)
    poker.hands[3].cards[0] = Card.new(Suit::SPADE, 1)
    poker.hands[3].cards[1] = Card.new(Suit::SPADE, 10)
    poker.hands[3].cards[2] = Card.new(Suit::SPADE, 11)
    poker.hands[3].cards[3] = Card.new(Suit::SPADE, 12)
    poker.hands[3].cards[4] = Card.new(Suit::SPADE, 13)

    result = poker.winner

    assert_equal(poker.hands[3], result)
  end
end

require 'ui/ui'
require 'suit'
require 'card'
require 'poker'
require 'test/unit'
require 'mocha'

class TestHand < Test::Unit::TestCase
  def test_initialize_5
    poker = Poker.new
    assert_equal(5, poker.players.size)
  end

  def test_initialize_7
    poker = Poker.new(UI.new, 7)
    assert_equal(7, poker.players.size)
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
    poker.players.each do |player|
      assert_equal(5, player.hand.cards.size)
    end
  end

  def test_discard_prime
    ui = mock()
    ui.expects(:print).with('ace of spades, 2 of spades, 4 of hearts, 5 of hearts, 6 of hearts').returns('')
    ui.expects(:prompt).with('Discard?').returns('0,1')
    poker = Poker.new(ui, 1)
    poker.shuffle
    poker.deal
    poker.players[0].hand.cards[0] = Card.new(Suit::SPADE, 1)
    poker.players[0].hand.cards[1] = Card.new(Suit::SPADE, 2)
    poker.players[0].hand.cards[2] = Card.new(Suit::HEART, 4)
    poker.players[0].hand.cards[3] = Card.new(Suit::HEART, 5)
    poker.players[0].hand.cards[4] = Card.new(Suit::HEART, 6)

    poker.discard

    assert_equal(3, poker.players[0].hand.cards.size)
  end

  def test_redeal
    poker = Poker.new
    poker.shuffle
    poker.deal

    poker.players.each do |player|
      player.hand.discard(0)
    end

    poker.redeal

    assert_equal(22, poker.deck.cards.size)
    poker.players.each do |player|
      assert_equal(5, player.hand.cards.size)
    end
  end

  def test_print
    ui = mock()
    ui.expects(:print).with('ace of spades, 2 of spades, 4 of hearts, 5 of hearts, 6 of hearts').returns('')
    ui.expects(:print).with('5 of spades, 6 of spades, 7 of hearts, 8 of hearts, 9 of hearts').returns('')

    poker = Poker.new(ui, 2)
    poker.shuffle
    poker.deal
    poker.players[0].hand.cards[0] = Card.new(Suit::SPADE, 1)
    poker.players[0].hand.cards[1] = Card.new(Suit::SPADE, 2)
    poker.players[0].hand.cards[2] = Card.new(Suit::HEART, 4)
    poker.players[0].hand.cards[3] = Card.new(Suit::HEART, 5)
    poker.players[0].hand.cards[4] = Card.new(Suit::HEART, 6)
    poker.players[1].hand.cards[0] = Card.new(Suit::SPADE, 5)
    poker.players[1].hand.cards[1] = Card.new(Suit::SPADE, 6)
    poker.players[1].hand.cards[2] = Card.new(Suit::HEART, 7)
    poker.players[1].hand.cards[3] = Card.new(Suit::HEART, 8)
    poker.players[1].hand.cards[4] = Card.new(Suit::HEART, 9)

    poker.print
  end

  def test_winner_first
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.players[0].hand.cards[0] = Card.new(Suit::SPADE, 1)
    poker.players[0].hand.cards[1] = Card.new(Suit::SPADE, 10)
    poker.players[0].hand.cards[2] = Card.new(Suit::SPADE, 11)
    poker.players[0].hand.cards[3] = Card.new(Suit::SPADE, 12)
    poker.players[0].hand.cards[4] = Card.new(Suit::SPADE, 13)
    poker.players[1].hand.cards[0] = Card.new(Suit::HEART, 1)
    poker.players[1].hand.cards[1] = Card.new(Suit::CLUB, 3)
    poker.players[1].hand.cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.players[1].hand.cards[3] = Card.new(Suit::SPADE, 7)
    poker.players[1].hand.cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.players[2].hand.cards[0] = Card.new(Suit::HEART, 2)
    poker.players[2].hand.cards[1] = Card.new(Suit::CLUB, 4)
    poker.players[2].hand.cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.players[2].hand.cards[3] = Card.new(Suit::SPADE, 8)
    poker.players[2].hand.cards[4] = Card.new(Suit::DIAMOND, 10)

    result = poker.winner

    assert_equal(poker.players[0], result)
  end

  def test_winner_middle
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.players[0].hand.cards[0] = Card.new(Suit::HEART, 1)
    poker.players[0].hand.cards[1] = Card.new(Suit::CLUB, 3)
    poker.players[0].hand.cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.players[0].hand.cards[3] = Card.new(Suit::SPADE, 7)
    poker.players[0].hand.cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.players[1].hand.cards[0] = Card.new(Suit::SPADE, 1)
    poker.players[1].hand.cards[1] = Card.new(Suit::SPADE, 10)
    poker.players[1].hand.cards[2] = Card.new(Suit::SPADE, 11)
    poker.players[1].hand.cards[3] = Card.new(Suit::SPADE, 12)
    poker.players[1].hand.cards[4] = Card.new(Suit::SPADE, 13)
    poker.players[2].hand.cards[0] = Card.new(Suit::HEART, 2)
    poker.players[2].hand.cards[1] = Card.new(Suit::CLUB, 4)
    poker.players[2].hand.cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.players[2].hand.cards[3] = Card.new(Suit::SPADE, 8)
    poker.players[2].hand.cards[4] = Card.new(Suit::DIAMOND, 10)

    result = poker.winner

    assert_equal(poker.players[1], result)
  end

  def test_winner_last
    poker = Poker.new(UI.new, 3)
    poker.shuffle
    poker.deal

    poker.players[0].hand.cards[0] = Card.new(Suit::HEART, 1)
    poker.players[0].hand.cards[1] = Card.new(Suit::CLUB, 3)
    poker.players[0].hand.cards[2] = Card.new(Suit::DIAMOND, 5)
    poker.players[0].hand.cards[3] = Card.new(Suit::SPADE, 7)
    poker.players[0].hand.cards[4] = Card.new(Suit::DIAMOND, 9)
    poker.players[1].hand.cards[0] = Card.new(Suit::HEART, 2)
    poker.players[1].hand.cards[1] = Card.new(Suit::CLUB, 4)
    poker.players[1].hand.cards[2] = Card.new(Suit::DIAMOND, 6)
    poker.players[1].hand.cards[3] = Card.new(Suit::SPADE, 8)
    poker.players[1].hand.cards[4] = Card.new(Suit::DIAMOND, 10)
    poker.players[2].hand.cards[0] = Card.new(Suit::SPADE, 1)
    poker.players[2].hand.cards[1] = Card.new(Suit::SPADE, 10)
    poker.players[2].hand.cards[2] = Card.new(Suit::SPADE, 11)
    poker.players[2].hand.cards[3] = Card.new(Suit::SPADE, 12)
    poker.players[2].hand.cards[4] = Card.new(Suit::SPADE, 13)

    result = poker.winner

    assert_equal(poker.players[2], result)
  end
end

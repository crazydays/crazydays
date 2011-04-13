require 'suit.rb'
require 'test/unit'

class TestSuit < Test::Unit::TestCase
  def test_initialize
    suit = Suit.new(:spade)
    assert_equal(:spade, suit.value)
    assert_raise(InvalidSuitError) { s5 = Suit.new(:wrong) }
  end

  def test_isBlack?
    s1 = Suit.new(:spade)
    assert(s1.isBlack?)

    s2 = Suit.new(:club)
    assert(s2.isBlack?)
  end

  def test_isRed?
    s1 = Suit.new(:heart)
    assert(s1.isRed?)

    s2 = Suit.new(:diamond)
    assert(s2.isRed?)
  end

  def test_to_s
    s1 = Suit.new(:spade)
    assert_equal("spades", s1.to_s)
    s2 = Suit.new(:diamond)
    assert_equal("diamonds", s2.to_s)
    s3 = Suit.new(:club)
    assert_equal("clubs", s3.to_s)
    s4 = Suit.new(:heart)
    assert_equal("hearts", s4.to_s)
  end

  def test_class_constants
    assert(Suit.new(:spade).eql?   Suit::SPADE)
    assert(Suit.new(:diamond).eql? Suit::DIAMOND)
    assert(Suit.new(:club).eql?    Suit::CLUB)
    assert(Suit.new(:heart).eql?   Suit::HEART)
  end
end

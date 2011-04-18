require 'test/unit'

class CardCountErrorTest < Test::Unit::TestCase
  def test_constructor_0
    assert_raise(ArgumentError) { CardCountError.new() }
  end

  def test_constructor_1
    result = CardCountError.new(5)

    assert_equal(5, result.actual)
    assert_nil(result.expected)
  end

  def test_constructor_2
    result = CardCountError.new(5, 7)

    assert_equal(5, result.actual)
    assert_equal(7, result.expected)
  end

  def test_error_message_no_expected
    error = CardCountError.new(5)

    assert_equal('', error.error_message)
  end

  def test_error_message_too_many
    error = CardCountError.new(5, 3)

    assert_equal('Too many cards!', error.error_message)
  end

  def test_error_message_too_few
    error = CardCountError.new(3, 5)

    assert_equal('Too few cards!', error.error_message)
  end

  def test_to_s_no_expected
    error = CardCountError.new(5)

    assert_equal('Actual: 5', error.to_s)
  end

  def test_to_s_with_expected
    error = CardCountError.new(5, 7)

    assert_equal('Too few cards! Expected: 7, Actual: 5', error.to_s)
  end
end
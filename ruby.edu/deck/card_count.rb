class CardCountError < StandardError
  attr_accessor :actual, :expected

  def initialize(actual, expected = 0)
    @actual = actual if actual > 0
    @expected = expected if expected > 0
  end

  def error_message
    if @expected.nil?
      ''
    elsif @actual < @expected
      'Too few cards!'
    else
      'Too many cards!'
    end
  end

  def to_s
    if @expected.nil?
      "Actual: #{@actual}"
    else
      "#{error_message} Expected: #{@expected}, Actual: #{@actual}"
    end
  end
end

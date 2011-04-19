require 'test/unit'
require 'player'

class TestPlayer < Test::Unit::TestCase
  def test_initialize
    player = Player.new

    assert_not_nil(player.hand)
    assert_instance_of(Hand, player.hand)
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/spot'

class SpotTest < Minitest::Test
  def setup
    @motorcycle_spot = Spot.new('motorcycle')
  end

  def test_it_exists
    assert_instance_of Spot, @motorcycle_spot
  end
end

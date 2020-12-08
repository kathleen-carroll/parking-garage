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

  def test_it_starts_empty_without_vehicle
    assert_nil @motorcycle_spot.vehicle, nil
    assert_equal @motorcycle_spot.empty, true
  end
end

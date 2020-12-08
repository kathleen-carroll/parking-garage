require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/spot'

class VehicleTest < Minitest::Test
  def setup
    @motorcycle = Vehicle.new('motorcycle')
    @spot = Spot.new
  end

  def test_it_exists
    assert_instance_of Vehicle, @motorcycle
  end

  def test_it_can_park_in_spot
    @motorcycle.park(@spot)

    assert_equal @spot.vehicle, @motorcycle
    assert_equal @motorcycle.parked, true
  end
end

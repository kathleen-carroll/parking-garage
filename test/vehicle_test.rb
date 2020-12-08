require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/spot'

class VehicleTest < Minitest::Test
  def setup
    @motorcycle = Vehicle.new('motorcycle')
    @bus = Vehicle.new('bus')
    @car = Vehicle.new('car')
    @spot = Spot.new
    @motorcycle_spot = Spot.new('motorcycle')
    @compact_spot = Spot.new('compact')
    @large_spot = Spot.new('large')
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Vehicle, @motorcycle
    assert_equal @motorcycle.name, 'motorcycle'
    assert_equal @bus.name, 'bus'
  end

  def test_it_can_park
    assert_equal @car.parked, false

    @car.park
    assert_equal @car.parked, true
  end
end

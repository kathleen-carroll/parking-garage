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

  def skip test_it_can_park_in_spot
    @motorcycle.park(@spot)

    assert_equal @spot.vehicle, @motorcycle
    assert_equal @motorcycle.parked, true
  end

  def skip test_only_certain_vehicles_can_park_and_in_empty_spots
    @motorcycle.park(@compact_spot)

    assert_equal @car.park(@compact_spot), "Sorry! Spot's already taken"
    refute_equal @compact_spot.vehicle, @car
    assert_equal @car.parked, false

    @car.park(@large_spot)

    assert_equal @large_spot.vehicle, @car
    assert_equal @car.parked, true
    assert_equal @large_spot.empty, false

    assert_equal @bus.park(@motorcycle_spot), "Can't park that here"
  end
end

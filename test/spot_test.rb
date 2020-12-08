require 'minitest/autorun'
require 'minitest/pride'
require './lib/spot'
require './lib/vehicle'

class SpotTest < Minitest::Test
  def setup
    @motorcycle_spot = Spot.new('motorcycle')
    @compact_spot = Spot.new('compact')
    @large_spot = Spot.new('large')
    @motorcyle = Vehicle.new('motorcyle')
  end

  def test_it_exists
    assert_instance_of Spot, @motorcycle_spot
  end

  def test_it_starts_empty_without_vehicle
    assert_nil @motorcycle_spot.vehicle, nil
    assert_equal @motorcycle_spot.empty, true
  end

  def test_it_can_have_other_types
    assert_equal @compact_spot.type, 'compact'
    assert_equal @large_spot.type, 'large'
  end

  def test_vehicle_can_park
    @motorcycle.park(@motorcyle_spot)

    assert_equal @motorcyle_spot.vehicle, @motorcyle
  end

  def test_only_certain_vehicles_can_park_and_in_empty_spots
  end
end

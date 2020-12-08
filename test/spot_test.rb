require 'minitest/autorun'
require 'minitest/pride'
require './lib/spot'
require './lib/vehicle'

class SpotTest < Minitest::Test
  def setup
    @spot = Spot.new
    @motorcycle_spot = Spot.new('motorcycle')
    @compact_spot = Spot.new('compact')
    @large_spot = Spot.new('large')
    @motorcycle = Vehicle.new('motorcycle')
  end

  def test_it_exists
    assert_instance_of Spot, @motorcycle_spot
  end

  def test_it_has_type_and_compact_default
    assert_equal @spot.type, "compact"
    assert_equal @motorcycle_spot.type, "motorcycle"
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
    @motorcycle.park(@motorcycle_spot)

    assert_equal @motorcycle_spot.vehicle, @motorcycle
    assert_equal @motorcycle_spot.empty, false
  end

  def test_only_certain_vehicles_can_park_and_in_empty_spots
  end
end

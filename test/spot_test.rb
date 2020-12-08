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
    @bus = Vehicle.new('bus')
    @car = Vehicle.new('car')
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

  def test_it_can_validate_spots_for_vehicle_types
    assert_equal @motorcycle_spot.valid_spot?(@motorcycle), true
    assert_equal @motorcycle_spot.valid_spot?(@bus), false
    assert_equal @motorcycle_spot.valid_spot?(@car), false

    assert_equal @compact_spot.valid_spot?(@motorcycle), true
    assert_equal @compact_spot.valid_spot?(@bus), false
    assert_equal @compact_spot.valid_spot?(@car), true

    assert_equal @large_spot.valid_spot?(@motorcycle), true
    assert_equal @large_spot.valid_spot?(@bus), true #bus needs 5 spots need to test this in the row
    assert_equal @large_spot.valid_spot?(@car), true
  end

  def test_vehicle_can_park_and_vehicle_is_parked
    @motorcycle_spot.park(@motorcycle)

    assert_equal @motorcycle_spot.vehicle, @motorcycle
    assert_equal @motorcycle_spot.empty, false
    assert_equal @motorcycle.parked, true
  end

  def test_only_certain_vehicles_can_park_and_in_empty_spots
    @compact_spot.park(@motorcycle)

    assert_equal @compact_spot.park(@car), "Sorry! Spot's already taken"
    refute_equal @compact_spot.vehicle, @car
    assert_equal @car.parked, false

    @large_spot.park(@car)

    assert_equal @large_spot.vehicle, @car
    assert_equal @car.parked, true
    assert_equal @large_spot.empty, false

    assert_equal @motorcycle_spot.park(@bus), "Can't park that here"
  end
end

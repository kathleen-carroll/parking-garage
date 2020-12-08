require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'
require './lib/vehicle'

class RowTest < Minitest::Test
  def setup
    @row1 = Row.new
    spot1 = Spot.new('compact')
    spot2 = Spot.new('motorcycle')
    spot3 = Spot.new('large')
    @spots = [spot1, spot2, spot3]
    @row2 = Row.new(2, @spots)
    @motorcycle = Vehicle.new('motorcycle')
    @bus = Vehicle.new('bus')
    @car = Vehicle.new('car')
  end

  def test_it_exists
    assert_instance_of Row, @row1
  end

  def test_it_has_spots_and_can_accept_spots
    assert_equal @row1.spots, []
    assert_equal @row2.spots, @spots

    spot1 = Spot.new('moto')
    @row2.add_spot(spot1)

    assert_equal spot1, @row2.spots.last
    assert_equal 4, @row2.spots.length
  end

  def test_cars_and_motorcycles_can_park
    @row2.spots.first.park(@motorcycle)

    assert_equal @row2.spots.first.vehicle, @motorcycle
    assert_equal @row2.spots.first.empty, false
  end

  def test_it_can_find_empty_spots
    assert_equal @row2.empty_spots, @spots

    @row2.spots.first.park(@motorcycle)
    assert_equal @row2.empty_spots, @spots[1..-1]
  end

  def test_it_can_find_parked_cars
    assert_equal @row2.parked_cars, []

    @row2.spots.first.park(@motorcycle)
    assert_equal @row2.parked_cars, [@motorcycle]

    @row2.spots.last.park(@car)
    assert_equal @row2.parked_cars, [@motorcycle, @car]
  end

  def test_buses_can_park_in_multiple_spots
    spots = []

    5.times do
      spots << Spot.new('large')
    end

    row = Row.new(3, spots)

    assert_equal row.spots.count, 5

    row.park_bus(@bus, row.spots.first)

    assert_equal @bus.parked, true
    assert_equal row.spots.first.vehicle, @bus
    assert_equal row.spots.last.vehicle, @bus
  end

  def test_it_can_park_buses_in_five_spots_if_more_consecutive_spots
    spots = []

    10.times do
      spots << Spot.new('large')
    end

    row = Row.new(4, spots)

    spot = spots[4]

    row.park_bus(@bus, spot)

    assert_equal @bus.parked, true
    assert_equal spot.empty, false
    assert_equal spots[0].empty, false
    assert_equal spots[5].empty, true
  end

  def test_it_fails_when_spots_arent_consecutive
    spots = []

    3.times do
      spots << Spot.new('large')
    end
     2.times do
       spots << Spot.new('compact')
     end
     4.times do
       spots << Spot.new('large')
     end

     row = Row.new(5, spots)

     spot = spots[5]

     row.park_bus(@bus, spot)

     assert_equal @bus.parked, false
     assert_nil spot.vehicle
  end

  def test_it_fails_when_spots_arent_large
    spots = []

    7.times do
      spots << Spot.new('compact')
    end

    row = Row.new(2, spots)
    spot = spots[5]
    row.park_bus(@bus, spot)

    assert_nil spot.vehicle
    assert_equal @bus.parked, false
  end

  def test_it_handles_upper_limit_properly
    spots = []

    4.times do
      spots << Spot.new('compact')
    end
    3.times do
      spots << Spot.new('large')
    end

    row = Row.new(6, spots)
    spot = spots[4]
    row.park_bus(@bus, spot)

    assert_equal @bus.parked, false
    assert_nil spots.last.vehicle
  end

  def test_it_fails_when_spots_are_empty
    spots = []

    2.times do
      spots << Spot.new('large')
    end
    spot = Spot.new('large')
    spots << spot
    3.times do
      spots << Spot.new('large')
    end

    row = Row.new(10, spots)

    spot.park(@motorcycle)
    assert_equal spot.empty, false

    row.park_bus(@bus, spots[4])
    assert_equal @bus.parked, false
    assert_equal spots[4].empty, true
    assert_equal @motorcycle.parked, true
  end
end

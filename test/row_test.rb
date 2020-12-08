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
  end

  def skip test_it_exists
    assert_instance_of Row, @row1
  end

  def skip test_it_has_spots_and_can_accept_spots
    assert_equal @row1.spots, []
    assert_equal @row2.spots, @spots
    assert_equal @row2.spots.first.row_position, 1
    # maybe refactor to take a number of spots and type
    # have add spots or change spots method

    # row can be initialized with a number that could autogen spots
    # row can be initialized with spots array and can update spot position in row when added
    # row can have update method
  end

  def skip test_cars_and_motorcycles_can_park
    @row2.spots.first.park(@motorcycle)

    assert_equal @row2.spots.first.vehicle, @motorcycle
    assert_equal @row2.spots.first.empty, false
  end

  def skip test_it_can_find_empty_spots
    assert_equal @row2.empty_spots, @spots

    @row2.spots.first.park(@motorcycle)
    assert_equal @row2.empty_spots, @spots[1..-1]
  end

  def skip test_it_can_find_parked_cars
    assert_equal @row2.parked_cars, []

    @row2.spots.first.park(@motorcycle)
    assert_equal @row2.parked_cars, [@motorcycle]
  end

  def test_buses_can_park_in_multiple_spots
    bus = Vehicle.new('bus')
    spots = []

    5.times do
      spots << Spot.new('large')
    end

    row = Row.new(3, spots)

    assert_equal row.spots.count, 5

    row.park_bus(bus)

    # row.spots.first.park(bus)
    # bus.park(spots.first)
    # require "pry"; binding.pry

    assert_equal bus.parked, true
    assert_equal row.spots.first.vehicle, bus
    assert_equal row.spots.last.vehicle, bus
  end
end

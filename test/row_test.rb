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

  def test_it_can_evaluate_valid_bus_parking
    bus = Vehicle.new('bus')
    spots = []

    5.times do
      spots << Spot.new('large')
    end

    row = Row.new(3, spots)

    assert_equal row.spots.count, 5

    bus.park(spots.first)
    # require "pry"; binding.pry

    assert_equal bus.parked, true
    assert_equal row.spots.first.vehicle, bus
    assert_equal row.spots.last.vehicle, bus
  end
end

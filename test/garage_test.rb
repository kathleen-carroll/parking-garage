require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'
require './lib/vehicle'
require './lib/level'
require './lib/garage'

class GarageTest < Minitest::Test
  def setup
    # set up for first level
    @spots = []
    @spots2 = []
    5.times do
      @spots << Spot.new('compact')
    end
    5.times do
      @spots << Spot.new("large")
    end
    5.times do
      @spots << Spot.new('motorcycle')
    end
    @row1 = Row.new(1, @spots)

    15.times do
      @spots2 << Spot.new('compact')
    end

    @row2 = Row.new(2, @spots2)

    @level1 = Level.new(1, [@row1, @row2])

    # set up for second level
    @spots_L2 = []
    @spots2_L2 = []

    15.times do
      @spots_L2 << Spot.new("large")
    end

    10.times do
      @spots2_L2 << Spot.new("large")
    end
    5.times do
      @spots2_L2 << Spot.new("compact")
    end

    @row1_L2 = Row.new(1, @spots_L2)
    @row2_L2 = Row.new(2, @spots_L2)

    @level2 = Level.new(2, [@row1_L2, @row2_L2])

    # set up for level 3
    @spots_L3 = []
    @spots2_L3 = []

    15.times do
      @spots_L3 << Spot.new("motorcycle")
    end
    15.times do
      @spots2_L3 << Spot.new("compact")
    end

    @row1_L3 = Row.new(1, @spots_L3)
    @row2_L3 = Row.new(2, @spots2_L3)

    @level3 = Level.new(3, [@row1_L3, @row2_L3])


    @garage = Garage.new("Mall Parking", [@level1, @level2, @level3])

    @car = Vehicle.new("car")
    @bus = Vehicle.new("bus")
  end

  def test_it_exists_and_has_name
    assert_instance_of Garage, @garage
    assert_equal "Mall Parking", @garage.name
    assert_equal 3, @garage.levels.count
  end

  def test_it_has_levels_rows_and_spots
    assert_equal 1, @garage.levels.first.floor
    assert_equal 2, @garage.levels.last.rows.count
    assert_equal 15, @garage.levels[1].rows.first.spots.count
  end

  def test_different_vehicles_can_park
    @spots2_L3[8].park(@car)

    assert_equal true, @car.parked

    @row1.park_bus(@bus, @spots[8])
    assert_equal true, @bus.parked
  end

  def test_it_can_evaluate_garage_metrics
    assert_equal [], @garage.full_spots

    @spots2_L3[8].park(@car)
    assert_equal true, @car.parked
    @row1.park_bus(@bus, @spots[8])

    assert_equal 84, @garage.empty_spots.count
    assert_equal (6.0/90.0 * 100).round, @garage.percent_full
    assert_equal 17, @garage.percent_full_by_level(1)
  end
end

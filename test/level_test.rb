require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'
require './lib/vehicle'
require './lib/level'

class LevelTest < Minitest::Test
  def setup
    @spot1 = Spot.new('compact')
    @spot2 = Spot.new('motorcycle')
    @spot3 = Spot.new('large')
    @spots1 = [@spot1, @spot2, @spot3]
    @row1 = Row.new(1, @spots1)
    @spot4 = Spot.new('compact')
    @spot5 = Spot.new('motorcycle')
    @spot6 = Spot.new('large')
    @spots2 = [@spot4, @spot5, @spot6]
    @row2 = Row.new(2, @spots2)
    @rows = [@row1, @row2]
    @level1 = Level.new(1, @rows)
    @motorcycle = Vehicle.new('motorcycle')
    @car = Vehicle.new('car')
  end

  def test_it_exists
    assert_instance_of Level, @level1
  end

  def test_it_has_a_floor_num_and_rows
    assert_equal  1, @level1.floor
    assert_equal  @rows, @level1.rows
  end

  def test_it_can_find_empty_spots
    assert_equal 6, @level1.empty_spots.length

    @spot1.park(@motorcycle)
    @spot4.park(@car)
    assert_equal @spot1.empty, false
    assert_equal @spot4.empty, false

    assert_equal 4, @level1.empty_spots.length
    assert_equal @spot2, @level1.empty_spots.first
  end

  def test_it_can_find_parked_cars
    assert_equal [], @level1.parked_cars
    @spot1.park(@motorcycle)
    @spot4.park(@car)

    assert_equal [@motorcycle, @car], @level1.parked_cars
  end

  def test_it_can_find_full_spots
    assert_equal [], @level1.full_spots

    @spot1.park(@motorcycle)
    @spot4.park(@car)

    assert_equal [@spot1, @spot4], @level1.full_spots
  end

end

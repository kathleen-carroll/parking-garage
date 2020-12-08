require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'
require './lib/vehicle'
require './lib/level'

class LevelTest < Minitest::Test
  def setup
    @row1 = Row.new
    spot1 = Spot.new('compact')
    spot2 = Spot.new('motorcycle')
    spot3 = Spot.new('large')
    @spots = [spot1, spot2, spot3]
    @row2 = Row.new(2, @spots)
    @rows = [@row1, @row2]
    @level1 = Level.new(1, @rows)
  end

  def test_it_exists
    assert_instance_of Level, @level1
  end

  def test_it_has_a_floor_num_and_rows
    assert_equal @level1.floor, 1
    assert_equal @level1.rows, @rows
  end

  def test_it_can_find_empty_spots
  end

  def test_it_can_find_parked_cars
  end
end

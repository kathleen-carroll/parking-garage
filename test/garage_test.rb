require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'
require './lib/vehicle'
require './lib/level'
require './lib/garage'

class GarageTest < Minitest::Test
  def setup
    @garage = Garage.new
    # @row1 = Row.new
    # spot1 = Spot.new('compact')
    # spot2 = Spot.new('motorcycle')
    # spot3 = Spot.new('large')
    # @spots = [spot1, spot2, spot3]
    # @row2 = Row.new(2, @spots)
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end
end

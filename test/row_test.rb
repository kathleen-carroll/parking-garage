require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'
require './lib/spot'

class RowTest < Minitest::Test
  def setup
    @row1 = Row.new
    spot1 = Spot.new('compact')
    spot2 = Spot.new('motorcycle')
    spot3 = Spot.new('large')
    @spots = [spot1, spot2, spot3]
    @row2 = Row.new(@spots)
  end

  def test_it_exists
    assert_instance_of Row, @row1
  end

  def test_it_has_spots_and_can_accept_spots
    assert_equal @row1.spots, []
    assert_equal @row2.spots, @spots
    # maybe refactor to take a number of spots and type
    # have add spots or change spots method
  end
end

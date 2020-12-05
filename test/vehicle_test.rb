require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'

class VehicleTest < Minitest::Test
  def setup
    @motorcycle = Vehicle.new('motorcycle')
  end

  def test_it_exists
    assert_instance_of Vehicle, @motorcycle
  end
end

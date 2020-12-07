require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'

class RowTest < Minitest::Test
  def setup
    @row1 = Row.new
  end

  def test_it_exists
    assert_instance_of Row, @row1
  end
end

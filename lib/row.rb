class Row
  attr_reader :spots, :id

  def initialize(id = 1, spots = [])
    @id = id
    @spots = add(spots)
    # add row number or letter/name
  end

  def add(spots)
    spots.each_with_index {|spot, i| spot.row_position = i + 1
       spot.row = self}
    @spots = spots
  end

  def valid_row_position?
    # require "pry"; binding.pry
  end
end

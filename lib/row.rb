class Row
  attr_reader :spots, :id

  def initialize(id = 1, spots = [])
    @id = id #is this necessary still?
    @spots = add(spots)
  end

  def add(spots)
    spots.each_with_index {|spot, i| spot.row_position = i + 1}
    @spots = spots
  end

  def empty_spots
    @spots.find_all {|spot| spot.empty}
  end

  def parked_cars
    @spots.map{|spot| spot.vehicle if spot.vehicle}.compact
  end

  def park_bus(bus)
    row_checked = true
    require "pry"; binding.pry
    @spots[0].park(bus, true)
  end

  def valid_row_position?
    # require "pry"; binding.pry
  end
end

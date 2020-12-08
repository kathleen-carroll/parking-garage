class Row
  attr_reader :spots, :id

  def initialize(id = 1, spots = [])
    @id = id #is this necessary still?
    @spots = add(spots)
  end

  def add(spots)
    # spots.each_with_index {|spot, i| spot.row_position = i + 1}
    @spots = spots
  end

  def empty_spots
    @spots.find_all {|spot| spot.empty}
  end

  def parked_cars
    @spots.map{|spot| spot.vehicle if spot.vehicle}.compact
  end

  def park_bus(bus, spot)
    if valid_spots(spot).count == 5
      row_checked = true
      valid_spots(spot).each {|spot| spot.park(bus, row_checked)}
    else
      "The spot you chose does not have 4 other open spots surrounding it"
    end
  end

  # refactor everything from here down into row logic

  def valid_row_position?(vehicle)
    # goal find 5 consecutive large spots
    # split spots array to be within 4 spaces of spot
    # find all the large consecutive spots


    # require "pry"; binding.pry
    # valid_spots
    valid_spots(vehicle).count == 5


    # counter = @row_position

    # @row.spots.each_with_index do |spot, i|
    #   if i + 1 <= @row_position + 4
    #   end
    # end
  end

  def valid_spots(spot)
    # return false if vehicle != 'bus'  #guard statement against other vehicles trying to be parked as buses when dont need same validation
    i = @spots.index(spot)

    lower_limit_i = i - 4
    upper_limit_i = i + 4

    lower_limit_i = 0 if lower_limit_i < 0
    surrounding_spots = @spots[lower_limit_i..upper_limit_i]

    valid_spots = []
    surrounding_spots.each do |spot|
      if spot.empty && spot.type == 'large'
        valid_spots << spot
      else
        valid_spots = []
      end
    end

    valid_spots
  end
end

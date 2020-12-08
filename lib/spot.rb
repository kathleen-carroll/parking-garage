class Spot
  attr_reader :type
  attr_accessor :vehicle, :empty, :row_position, :row

  def initialize(type = 'compact')
    @type = type
    @empty = true
    @vehicle = nil
    @row_position = nil
    @row = nil
  end

  def valid_spot?(vehicle)
    # this method evaluates if a certain vehicle can park in type of spot
    if vehicle.name == 'motorcycle'
      true
    elsif vehicle.name == 'car' && (@type == 'compact' || @type == 'large')
      true
    elsif vehicle.name == 'bus' && @type == 'large'
      # only validating type of spot we will worry about consecutive spots in row class
      true
      # valid_row_position?(vehicle.name)
    else
      false
    end
  end

  def park(vehicle)
    # if valid_spot?(vehicle) && spot.valid_spots
    #   park_bus(valid_spots)
    if valid_spot?(vehicle) && @empty
      vehicle.park
      @empty = false
      @vehicle = vehicle
    elsif !@empty
      "Sorry! Spot's already taken"
    else
      "Can't park that here"
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

  def valid_spots(vehicle)
    # require "pry"; binding.pry
    return false if vehicle != 'bus'
    lower_limit_i = @row_position - 3
    upper_limit_i = @row_position + 3

    lower_limit_i = 0 if lower_limit_i < 0
    surrounding_spots = @row.spots[lower_limit_i..upper_limit_i]

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

  # from vehicle class need to refactor
  #
  # def park_bus(spots)
  #   spots.each {|spot| park(spot)}
  # end
end

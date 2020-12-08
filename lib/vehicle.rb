class Vehicle
  attr_reader :name, :parked

  def initialize(name)
    @name = name
    @parked = false
  end

  def park(spot)
    if spot.valid?(self) && spot.valid_spots(self)
      park_bus(spot.valid_spots(self))
    elsif spot.valid?(self) && spot.empty
      @parked = true
      spot.empty = false
      spot.vehicle = self
    elsif !spot.empty
      "Sorry! Spot's already taken"
    else
      "Can't park that here"
    end
  end

  def park_bus(spots)
    spots.each {|spot| park(spot)}
  end
end

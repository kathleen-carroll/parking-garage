class Vehicle
  attr_reader :name, :parked

  def initialize(name)
    @name = name
    @parked = false
  end

  def park(spot)
    if spot.valid?(self) && spot.empty
      @parked = true
      spot.empty = false
      spot.vehicle = self
    elsif !spot.empty
      "Sorry! Spot's already taken"
    else
      "Can't park that here"
    end
  end
end

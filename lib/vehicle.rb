class Vehicle
  attr_reader :name, :parked

  def initialize(name)
    @name = name
    @parked = false
  end

  def park(spot)
    @parked = true
    spot.empty = false
    spot.vehicle = self
  end
end

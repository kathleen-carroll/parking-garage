class Vehicle
  attr_reader :name, :parked

  def initialize(name)
    @name = name
    @parked = false
  end

  # park functionality here should only be on car level and set parked to true

  def park
    @parked = true
  end
end

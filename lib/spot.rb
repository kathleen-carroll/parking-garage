class Spot
  attr_reader :type
  attr_accessor :vehicle, :empty

  def initialize(type = 'compact')
    @type = type
    @empty = true
    @vehicle = nil
  end

  def valid_spot?(vehicle)
    # only checks if a certain vehicle can park in type of spot and if its empty not full bus parking check
    if vehicle.name == 'motorcycle' && @empty
      true
    elsif vehicle.name == 'car' && (@type == 'compact' || @type == 'large') && @empty
      true
    elsif vehicle.name == 'bus' && @type == 'large' && @empty
      # only validating type of spot we will worry about consecutive spots and full bus parking validation in row class
      true
    else
      false
    end
  end

  def park(vehicle, row_checked = false)
    # checks to see if bus is trying to park in single spot and prevents it, want different error message here from invalid spot
    if row_checked == false && vehicle.name == 'bus' && valid_spot?(vehicle)
      "Sorry can't park bus in a single spot, park in the row"
    # validates spot and allows to park, buses will bipass this by setting row_checked to true in bus parking method in row class
    elsif valid_spot?(vehicle)
      vehicle.park
      @empty = false
      @vehicle = vehicle
    # if spot is not available print that as a message
    elsif !@empty
      "Sorry! Spot's already taken"
    # if validation fails print that as a message
    else
      "Can't park that here"
    end
  end
end

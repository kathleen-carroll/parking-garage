class Spot
  attr_reader :type
  attr_accessor :vehicle, :empty

  def initialize(type = 'compact')
    @type = type
    @empty = true
    @vehicle = nil
  end

  def valid?(vehicle)
    if vehicle.name == 'motorcycle'
      true
    elsif vehicle.name == 'car' && (@type == 'compact' || @type == 'large')
      true
    else
      false
    end
  end
end

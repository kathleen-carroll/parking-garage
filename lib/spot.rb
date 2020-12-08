class Spot
  attr_reader :type, :vehicle, :empty

  def initialize(type)
    @type = type
    @empty = true
    @vehicle = nil
  end
end

class Spot
  attr_reader :type
  attr_accessor :vehicle, :empty

  def initialize(type = 'compact')
    @type = type
    @empty = true
    @vehicle = nil
  end
end

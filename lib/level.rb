class Level
  attr_reader :floor, :rows

  def initialize(floor, rows)
    @floor = floor
    @rows = rows
  end

  def empty_spots
    @rows.map{|row| row.empty_spots}.flatten
  end

  def full_spots
    @rows.map{|row| row.full_spots}.flatten
  end

  def parked_cars
    @rows.map{|row| row.parked_cars}.flatten
  end

end

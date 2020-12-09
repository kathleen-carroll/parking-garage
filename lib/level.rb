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

  def percent_full
    total_spots = @rows.map{|row| row.spots.count}.sum

    ((full_spots.count.to_f / total_spots.to_f) * 100.0).round
  end

  def open_rows
    @rows.find_all{|row| row.full_spots.count != row.spots.count}
  end

end

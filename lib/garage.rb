class Garage
  attr_reader :name, :levels

  def initialize(name, levels)
    @name = name
    @levels = levels
  end

  def empty_spots
    @levels.map{|level| level.empty_spots}.flatten
  end

  def full_spots
    @levels.map{|level| level.full_spots}.flatten
  end

  def percent_full
    total_spots = full_spots.count + empty_spots.count

    ((full_spots.count.to_f / total_spots.to_f) * 100).round
  end

  def percent_full_by_level(num)
    level = @levels.find{|level| level.floor == num}

    level.percent_full
  end
end

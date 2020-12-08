class Row
  attr_reader :spots, :id

  def initialize(id = 1, spots = [])
    @id = id #is this necessary still?
    @spots = add(spots)
  end

  def add(spots)
    @spots = spots
  end

  def add_spot(spot)
    @spots << spot
  end

  def empty_spots
    @spots.find_all {|spot| spot.empty}
  end

  def parked_cars
    @spots.map{|spot| spot.vehicle if spot.vehicle}.compact
  end

  def park_bus(bus, spot)
    # in order to park a bus there must be 5 large consecutive spots in a row
    # if there are 5 spots update each spot with bus vehicle using row_checked flag
    if valid_spots(spot).count == 5
      row_checked = true
      valid_spots(spot).each {|spot| spot.park(bus, row_checked)}
    else
      "The spot you chose does not have 4 other open spots surrounding it"
    end
  end

  def valid_spots(spot)
    # goal find 5 consecutive large spots
    # split spots array to be within 4 spaces of spot
    # find all the large consecutive spots and return first 5 valid parking spots as results

    surrounding_spots = consecutive_spots(spot)
    valid_spots = []
    surrounding_spots.each do |spot|
      if spot.empty && spot.type == 'large'
        valid_spots << spot
      else
        valid_spots = []
      end
    end

    valid_spots[0..4]  #grab only the first 5 valid spots
  end

  def consecutive_spots(spot)
    # find only range of spots around current parking spot by finding spots + or - 4 index positions away
    # or at the start/end of spots array whichever comes first
    i = @spots.index(spot)

    lower_limit_i = i - 4
    upper_limit_i = i + 4
    lower_limit_i = 0 if lower_limit_i < 0

    @spots[lower_limit_i..upper_limit_i]
  end
end

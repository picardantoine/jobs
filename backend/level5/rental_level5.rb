require '../level3/rental_level3'

class RentalLevel5 < RentalLevel3
attr_accessor :options

  def initialize(id, car, start_date, end_date, distance)
    super(id, car, start_date, end_date, distance)

    @options = []
  end
end

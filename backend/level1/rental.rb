require 'date'

class Rental
  attr_reader :id, :price

  def initialize(id, car, start_date, end_date, distance)
    @id = id
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance

    @duration = compute_duration
    @price = compute_price
  end

  def compute_duration
    duration = (Date.parse(@end_date) - Date.parse(@start_date)).to_i + 1
  end

  def compute_price
    price = @duration * @car.price_per_day + @distance * @car.price_per_km
  end
end

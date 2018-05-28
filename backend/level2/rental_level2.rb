require "../level1/rental"

class RentalLevel2 < Rental

  def initialize (id, car, start_date, end_date, distance)
    @pricing_array = [
      {milestone: 0, rate: 0},
      {milestone: 1, rate: 0.1},
      {milestone: 4, rate: 0.3},
      {milestone: 10, rate: 0.5}
    ]
    super
  end

  def compute_price
    price = (compute_distance_price + compute_duration_price(@duration)).to_i
  end

  def compute_distance_price
    distance_price = @distance * @car.price_per_km
  end

  def compute_duration_price(days)
    duration_price = 0
    @pricing_array = @pricing_array.sort!{|x,y| x[:milestone]<=>y[:milestone]}
    for pricing in @pricing_array.reverse
      if days > pricing[:milestone]
        duration_price = @car.price_per_day * (1 - pricing[:rate]) +
          compute_duration_price(days - 1)
        break
      end
    end
    return duration_price
  end
end

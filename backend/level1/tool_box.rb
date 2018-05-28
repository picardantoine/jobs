require 'json'
require_relative "car"

class ToolBox

  def initialize(rental_class)
    @rental_class = rental_class
  end

  def parse_input
    filepath = "./data/input.json"
    serialized_input = File.read(filepath)
    return input = JSON.parse(serialized_input)
  end

  def get_cars(input)
    cars = []
    input["cars"].each do |car|
      car = Car.new(car["id"], car["price_per_day"], car["price_per_km"])
      cars << car
    end
    return cars
  end

  def get_rentals(input,cars)
    rentals = []
    input["rentals"].each do |rental|
      car = (cars.select { |car| car.id == rental["car_id"]}).first
      rental = @rental_class.new(rental["id"], car, rental["start_date"],
        rental["end_date"], rental["distance"])
      rentals << rental
    end
    return rentals
  end

  def create_output(rentals)
    output = {"rentals"=>[]}
    rentals.each do |rental|
      output["rentals"] << {"id": rental.id, "price": rental.price}
    end
    return output
  end

  def store_output(output)
    filepath = "data/output.json"
    File.open(filepath, 'wb') do |file|
      file.write(JSON.pretty_generate(output))
    end
  end
end

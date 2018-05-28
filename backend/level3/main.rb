require './tool_box_level3'
require './rental_level3'
require './commission'

def main
  tool_box = ToolBoxLevel3.new(RentalLevel3, Commission)

  input = tool_box.parse_input

  cars = tool_box.get_cars(input)
  rentals = tool_box.get_rentals(input, cars)
  commissions = tool_box.get_commissions(rentals)

  output = tool_box.create_output(commissions)
  tool_box.store_output(output)

  print "output generated successfully :) "
end

main


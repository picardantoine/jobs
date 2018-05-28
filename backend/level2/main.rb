require '../level1/tool_box'
require_relative 'rental_level2'

def main
  tool_box = ToolBox.new(RentalLevel2)

  input = tool_box.parse_input

  cars = tool_box.get_cars(input)
  rentals = tool_box.get_rentals(input, cars)

  output = tool_box.create_output(rentals)
  tool_box.store_output(output)

  print "output generated successfully :) "
end

main




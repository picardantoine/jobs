require_relative 'tool_box_level4'
require '../level3/rental_level3'
require_relative 'action'
require_relative 'commission_level4'
require_relative 'actions_set'

def main
  tool_box = ToolBoxLevel4.new(RentalLevel3, CommissionLevel4, Action, ActionsSet)

  input = tool_box.parse_input

  cars = tool_box.get_cars(input)
  rentals = tool_box.get_rentals(input, cars)
  commissions = tool_box.get_commissions(rentals)
  actions_sets = tool_box.get_actions_sets(commissions)

  output = tool_box.create_output(actions_sets)
  tool_box.store_output(output)

  print "output generated successfully :) "
end

main













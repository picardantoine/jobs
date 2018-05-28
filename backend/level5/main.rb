require '../level5/tool_box_level5'
require '../level5/rental_level5'
require '../level4/commission_level4'
require '../level4/action'
require '../level5/actions_set_level5'


def main
  tool_box = ToolBoxLevel5.new(RentalLevel5, CommissionLevel4, Action,
    ActionsSetLevel5)

  input = tool_box.parse_input

  cars = tool_box.get_cars(input)
  rentals = tool_box.get_rentals(input, cars)
  commissions = tool_box.get_commissions(rentals)
  options = tool_box.get_options(input,rentals)
  actions_sets = tool_box.get_actions_sets(commissions)

  output = tool_box.create_output(actions_sets)
  tool_box.store_output(output)

  print "output generated successfully :) "
end

main













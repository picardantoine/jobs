require '../level4/tool_box_level4'
require '../level5/option'


class ToolBoxLevel5 < ToolBoxLevel4

  def get_options(input, rentals)
    input["options"].each do |option|
      rental = (rentals.select {|rental| rental.id == option["rental_id"]}).first
      rental.options << Option.new(option["id"], rental, option["type"])
    end
  end

  def options_output(actions_set)
    options = actions_set.commission.rental.options
    options_output = []
    options.each do |option|
      options_output << option.type
    end
    return options_output
  end

  def create_output(actions_sets)
    output = {"rentals"=>[]}
    actions_sets.each do |actions_set|
      output["rentals"] <<
      {
        "id": actions_set.commission.rental.id,
        "options": options_output(actions_set),
        "actions": actions_set_output(actions_set)
      }
    end
    return output
  end
end

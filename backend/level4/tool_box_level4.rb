require '../level3/tool_box_level3'

class ToolBoxLevel4 < ToolBoxLevel3

  def initialize(rental_class, commission_class, action_class, actions_set_class)
    super(rental_class, commission_class)
    @action_class = action_class
    @actions_set_class = actions_set_class
  end

  def get_actions_sets(commissions)
    actions_sets = []
    commissions.each do |commission|
      actions_set = @actions_set_class.new(commission, @action_class)
      actions_sets << actions_set
    end
    return actions_sets
  end

  def action_output(action)
    output = {
          "who": action.category,
          "type": action.type,
          "amount": action.amount
        }
    return output
  end

  def actions_set_output(actions_set)
    actions_set_output = []
    actions_set_output << action_output(actions_set.driver_action)
    actions_set_output << action_output(actions_set.owner_action)
    actions_set_output << action_output(actions_set.insurance_action)
    actions_set_output << action_output(actions_set.assistance_action)
    actions_set_output << action_output(actions_set.drivy_action)
    return actions_set_output
  end

  def create_output(actions_sets)
    output = {"rentals"=>[]}
    actions_sets.each do |actions_set|
      output["rentals"] <<
      {
        "id": actions_set.commission.rental.id,
        "actions": actions_set_output(actions_set)
      }
    end
    return output
  end
end

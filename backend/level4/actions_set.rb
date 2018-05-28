class ActionsSet
  attr_reader :commission, :driver_action, :owner_action, :insurance_action,
    :assistance_action, :drivy_action

  def initialize(commission, action_class)
    @commission = commission
    @action_class = action_class

    create_actions
  end

  def compute_amount(category)
    case category
      when "driver"
        amount = @commission.rental.price
      when "owner"
        amount = @commission.owner_share
      when "insurance"
        amount = @commission.insurance_fee
      when "assistance"
        amount = @commission.assistance_fee
      when "drivy"
        amount = @commission.drivy_fee
    end
    return amount
  end

  def create_actions
    @driver_action = @action_class.new("driver", "debit",
      compute_amount("driver"))
    @owner_action = @action_class.new("owner", "credit",
      compute_amount("owner"))
    @insurance_action = @action_class.new("insurance", "credit",
      compute_amount("insurance"))
    @assistance_action = @action_class.new("assistance", "credit",
      compute_amount("assistance"))
    @drivy_action = @action_class.new("drivy", "credit",
      compute_amount("drivy"))
  end
end

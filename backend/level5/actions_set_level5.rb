require '../level4/actions_set'

class ActionsSetLevel5 < ActionsSet

  def initialize(commission, action_class)
    @commission = commission
    @action_class = action_class

    @options_pricing = {
      "gps": 500,
      "baby_seat": 200,
      "additional_insurance": 1000
    }

    compute_amount_from_options
    create_actions
  end

  def compute_amount_from_options
    @amount_from_options_for_owner = 0
    @amount_from_options_for_drivy = 0

    @commission.rental.options.each do |option|
      case option.type
      when "gps"
        @amount_from_options_for_owner +=
          @options_pricing[:gps] * @commission.rental.duration
      when "baby_seat"
        @amount_from_options_for_owner +=
          @options_pricing[:baby_seat] * @commission.rental.duration
      when "additional_insurance"
        @amount_from_options_for_drivy +=
          @options_pricing[:additional_insurance] * @commission.rental.duration
      end
    end
    @amount_from_options_for_driver =
      @amount_from_options_for_owner + @amount_from_options_for_drivy
  end

  def compute_amount(category)
    case category
      when "driver"
        amount = @commission.rental.price + @amount_from_options_for_driver
      when "owner"
        amount = @commission.owner_share + @amount_from_options_for_owner
      when "insurance"
        amount = @commission.insurance_fee
      when "assistance"
        amount = @commission.assistance_fee
      when "drivy"
        amount = @commission.drivy_fee + @amount_from_options_for_drivy
    end
    return amount
  end
end

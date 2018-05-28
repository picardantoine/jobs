require '../level1/tool_box'

class ToolBoxLevel3 < ToolBox

  def initialize(rental_class, commission_class)
    super(rental_class)
    @commission_class = commission_class
  end

  def get_commissions(rentals)
    commissions = []
    rentals.each do |rental|
      commission = @commission_class.new(rental)
      commissions << commission
    end
    return commissions
  end

  def create_commission_output(commission)
    output = {
      "insurance_fee": commission.insurance_fee,
      "assistance_fee": commission.assistance_fee,
      "drivy_fee": commission.drivy_fee
    }
    return output
  end

  def create_output(commissions)
    output = {"rentals"=>[]}
    commissions.each do |commission|
      output["rentals"] << {
        "id": commission.rental.id,
        "price": commission.rental.price,
        "commission": create_commission_output(commission)
      }
    end
    return output
  end
end

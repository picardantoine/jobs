class Commission
attr_reader :rental, :insurance_fee, :assistance_fee, :drivy_fee

  def initialize(rental)
    @rental = rental

    @commission_rate = 0.3
    @insurance_rate = 0.5
    @assistance_price_per_day = 100

    @commission = compute_commission
    @insurance_fee = compute_insurance_fee
    @assistance_fee = compute_assistance_fee
    @drivy_fee = compute_drivy_fee
  end

  def compute_commission
    commission = (@commission_rate * @rental.price).to_i
  end

  def compute_insurance_fee
    insurance_fee = (@insurance_rate * @commission).to_i
  end

  def compute_assistance_fee
    assistance_fee = @assistance_price_per_day * @rental.duration
  end

  def compute_drivy_fee
    drivy_fee = @commission - @insurance_fee - @assistance_fee
  end
end

require '../level3/commission'

class CommissionLevel4 < Commission
  attr_reader :owner_share

  def initialize(rental)
    super
    @owner_share = compute_owner_share
  end

  def compute_owner_share
    owner_share = (@rental.price - @commission).to_i
  end
end

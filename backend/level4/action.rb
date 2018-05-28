class Action
attr_reader :category, :type, :amount

  def initialize(category, type, amount)
    @category = category
    @type = type
    @amount = amount
  end
end


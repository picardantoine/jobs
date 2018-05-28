class Option
attr_reader :type

  def initialize(id, rental, type)
    @id = id
    @rental = rental
    @type = type
  end
end

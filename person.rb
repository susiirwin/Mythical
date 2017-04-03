class Person
  attr_reader :name, :stoned, :hit

  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    @stoned
  end

  def hit
    @stoned = true
  end
end

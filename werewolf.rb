class Werewolf
  attr_reader :name, :location, :human

  def initialize(name, location = "London")
    @name = name
    @location = location
    @human = true
  end

  def human?
    @human
  end

  def change!
    @human = false
  end

  def wolf?
  end
end

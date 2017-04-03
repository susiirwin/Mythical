class Wizard
  attr_reader :name, :bearded

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @rested = true
    @spells_cast = 0
  end

  def bearded?
    @bearded
  end

  def incantation(directory)
    "sudo #{directory}"
  end

  def rested?
    if @spells_cast < 3
      @rested
    else
      @rested = false
    end
  end

  def cast
    @spells_cast += 1
    "MAGIC MISSILE!"
  end
end

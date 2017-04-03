class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    @statues << victim
    if @statues.count <= 3
      @statues
    elsif @statues.count > 3
      @statues.shift
      @statues
    end
    victim.hit
  end
end

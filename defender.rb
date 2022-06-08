class Defender
  attr_accessor :health, :strength

  def initialize(health = 1000, strength = 100_000_000_000_000)
    @defender_health = health
    @defender_strenght = strength
  end
end

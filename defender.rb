class Defender
  attr_accessor :health, :strength, :name

  def initialize(name, health, strength)
    @defender_name = name
    @defender_health = health
    @defender_strenght = strength
  end
end

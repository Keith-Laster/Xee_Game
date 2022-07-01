class Defender
  attr_accessor :health, :strength, :name

  def initialize(name, health, strength)
    @defender_name = name.capitalize
    @defender_health = health
    @defender_strength = strength
  end

  def self.say_hello
    puts "I'm #{@defender_name}"
  end

  if __FILE__ == $0
    defender = Defender.new('defender_test', 20, 9_494_993)
    puts defender.inspect
    puts @defender_name
    puts defender.name
    puts defender.health

    say_hello

  end
end

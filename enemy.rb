class Enemy
  attr_accessor :species, :health

  def initialize(species, health)
    @species = species
    @health = health
    @is_immoral = true
  end

  if __FILE__ == $0
    enemy_test = Enemy.new('troll', 140)
    puts enemy_test.name
    puts enemy_test.health
  end
end

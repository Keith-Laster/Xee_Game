

class Player
  attr_reader :name
  attr_accessor :health
  
  def initialize(name, health=100)
    @name = name
    @health = health
  end
  
  if __FILE__ ==$0
  player = Player.new("xee_player_test")
  puts player.name
  puts player.health
  end
end
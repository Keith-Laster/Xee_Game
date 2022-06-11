module Combat
  def enemy_move; end

  self.attack_type = {
    kick: 2,
    headbutt: 3
  }

  def attack(attack_type)
    roll_required(attack_type)
  end

  # def headbutt
  # roll_required(3)
  # end

  def wine_him
    puts 'How did a simpleton like you know that cavern goblins are allergic to the fruit of the vine?'
    enemy_damage(39)
  end

  def enemy_damage(pain_points)
    @enemy.health -= pain_points
    puts "you're enemy has sustained #{pain_points} of damage. Enemy health = #{@enemy.health}."
  end

  def jump_back
    puts "A cowardly choice... but you are light on your feet! You'll need to roll a 3 or higher."
    Roll.roll_die
    roll_score(3)
  end

  def throat_reach
    puts "....\n....\n....\nSo you're a bold one? Such a fool-hearty move will take roll of 4 or higher."
    Roll.roll_die
    roll_score(4)
  end

  def stay_still
    puts "So, you're a total panzy. Very well. You'll need a roll of 2 or higher."
    Roll.roll_die
    roll_score(2)
  end

  def mispell_bouncer
    puts 'It appears you cant spell. Log off and go back to school, you twit.'
    puts '...'
    puts 'but if you must persist...'
    triple_injure(@player)
  end

  def injure(player)
    player.health -= 5
    puts "\n #{player.name} was injured. Health is now #{player.health}"
  end

  def triple_injure(player)
    injure(player)
    injure(player)
    injure(player)
  end

  def formiddable_move
    puts 'It was a formmidable move. Your opponent was defeated and you sustained no damage.'
  end
end

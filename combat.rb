require_relative 'roll'

module Combat
  $attack_type = {
    kick: 2,
    headbutt: 3
  }

  def attack(attack_type)
    roll_required(attack_type)
    roll_die
    roll_score(attack_type)
  end

  def wine_him
    puts 'How did a simpleton like you know that cavern goblins are allergic to the fruit of the vine?'
    enemy_damage(39)
  end

  def enemy_damage(pain_points)
    @enemy.health -= pain_points
    puts "you're enemy has sustained #{pain_points} points of damage. Enemy health = #{@enemy.health}."
  end

  def enemy_move
    enemy_attacks = Array[method(:stab), method(:bite)]
    line_spacing
    enemy_attacks.sample.call
  end

  def stab
    @player.health -= 10
    puts "You're enemy has stabbed you! You're health is now at #{@player.health} points."
  end

  def bite
    @player.health -= 5
    puts "You're enemy has bitten you! You're health is now at #{@player.health} points."
  end

  def jump_back
    puts "A cowardly choice... but you are light on your feet! You'll need to roll a 3 or higher."
    roll_die
    snake_roll_score(3)
  end

  def throat_reach
    puts "....\n....\n....\nSo you're a bold one? Such a fool-hearty move will take roll of 4 or higher."
    roll_die
    snake_roll_score(4)
  end

  def stay_still
    puts "So, you're a total panzy. Very well. You'll need a roll of 2 or higher."
    roll_die
    snake_roll_score(2)
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

  def snake_formiddable_move
    puts 'It was a formmidable move. Your opponent was defeated and you sustained no damage.'
  end

  def move_fail
    puts "Your move failed. You're opponent sustained no damage."
  end

  def die_of_destiny
    puts "The die of destiny has spoken... You rolled a #{$print_die_roll}"
  end

  def roll_die
    die_roll = Roll.new
    $print_die_roll = die_roll.roll
    puts "scribe 'roll' when ready"
    @answer = gets.chomp.downcase
    if @answer == 'roll'
      line_spacing
    else
      roll_fail
    end
  end

  def snake_roll_score(score)
    die_of_destiny
    puts $print_die_roll
    if $print_die_roll.between?(1, score)
      injure(@player)
    else
      snake_formiddable_move
    end
    console_pause
  end

  def roll_score(score)
    die_of_destiny
    if $print_die_roll.between?(1, score)
      move_fail
    else
      enemy_damage(20)
    end

    console_pause
  end

  def roll_fail
    puts "scribe 'roll' when ready"
    roll_die
  end

  def roll_required(number)
    puts "you'll need to roll a #{number} or higher"
  end
end

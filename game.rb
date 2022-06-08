module Game
  def roll_die
    die_roll = Roll.new
    $print_die_roll = die_roll.roll
    puts "scribe 'roll' when ready"
    user_input
    if @answer == 'roll'
      line_spacing
      line_spacing
    else
      roll_fail
    end
  end

  # this is broken -- ask kyle
  def roll_score(score)
    die_of_destiny
    if $print_die_roll == (1...score)
      injure(@player)
    else
      formiddable_move
    end
    console_pause
  end

  def line_spacing
    puts "\n...
    \n
    \n...
    \n
    \n..."
  end

  def console_pause
    puts "Strike 'enter' when ready to move on."
    user_input
    line_spacing
  end

  def roll_fail
    puts "scribe 'roll' when ready"
    roll_die
  end

  def jump_back
    puts "A cowardly choice... but you are light on your feet! You'll need to roll a 3 or higher."
    roll_die
    roll_score(3)
  end

  def throat_reach
    puts "....\n....\n....\nSo you're a bold one? Such a fool-hearty move will take roll of 4 or higher."
    roll_die
    roll_score(4)
  end

  def stay_still
    puts "So, you're a total panzy. You'll need a roll of 2 or higher"
    roll_score(2)
  end

  def ready_fail
    puts "type 'yes' when ready."
  end

  def die_of_destiny
    puts "The die of destiny has spoken... You rolled a #{$print_die_roll}"
  end

  def get_user_name
    puts "\nPlease scribe your full name."
    @answer = gets.chomp.downcase
    if @answer == 'xeenyia lor laster'
      navigate_to_step(1.2)
    else
      navigate_to_step(1.3)
    end
  end

  def navigate_to_step(step)
    @step = step
  end

  def bouncer
    puts "Ahh #{@answer} it appears you are not on the guestlist and are therefore an emperial spy and will need to be hung. That is.. unlesss you spelled your name wrong? (try either 'xeenyia lor laster' or 'quit')"
    get_user_name
  end

  def mispell_bouncer
    puts 'It appears you cant spell. Log off and go back to school, you twit.'
    puts '...'
    puts 'but if you must persist...'
    triple_injure(@player)
  end

  def intro
    puts "Welcome to dead man's forest- the last place they'd ever look and therefore the only place you'll be safe.
        You're just in time, the ceremony is about to begin.
        The the bride, the groom, and the good people of our once great Kingdom welcome you- that is.... if you're name is on the guest list."
    navigate_to_step(1)
  end

  def play
    puts "\nAre you ready to enter the dark forest? (scribe 'yes' or 'no')"
    user_input
    case @answer
    when 'yes'
      navigate_to_step(2)
    else
      ready_fail
    end
  end

  def user_input
    @answer = gets.chomp.downcase
  end

  def create_player
    @player = Player.new("#{@answer.capitalize}")
    puts "Welcome to dead man's forest, #{@player.name}. Your current health is #{@player.health}."
    navigate_to_step(3)
  end

  def woods_to_wedding
    puts "\n...The light in the distance grows with eachs step. And soon you hear a sound in the distance you have not heard in half an age - laughter."
    puts "But at your feet you notice a red-eyed serpant. Do you ('jump back' 'reach for its throat' or 'stay perfectly still'?)"
    @answer = gets.chomp.downcase
    case @answer
    when 'jump back'
      jump_back
    when 'reach for its throat'
      throat_reach
    when 'stay perfectly still'
      injure(player)
    end
    navigate_to_step(4)
  end

  def arrive_wedding
    puts "You step out of the dark woods into the light of the wedding.
        The first sight you see is the most handsome man west of the Breakle river (and the Breakle river sits at the easternmost plot on the earth).
        \nYou're told his name is Keith, son of Jerry, Lord of Ruby Gems- wise as the eldar, strong as the northern sea.
        \nWell...what will it be then? Will you woo him or will you live a life of misery apart from his embrace? (type 'woo' or 'misery, please')"
    user_input
    case @answer
    when 'woo'
      line_spacing
      navigate_to_step(5.1)
    when 'misery, please'
      puts "You could have had it all. The cut of his jib is so perfect that I might go after him. And I'm a humble narrorator!"
      line_spacing
      navigate_to_step(5.2)
    end
  end

  def create_defender
    @defender = Defender.new
    puts "You're new defender is by your side - his loyalty attribute is as high as his strength attribute.
        \nYou're new defender, Keith, Son of Jerry, lord of Ruby Gems has a health of #{@defender.health} and a strenght of #{@defender.strength}"
    program_end
  end

  def injure(player)
    player.health -= 5
    puts "\n #{player.name} was injured. Health is now #{player.health}"
  end

  def formiddable_move
    puts 'It was a formmidable move - you sustained no damage.'
  end

  def triple_injure(player)
    injure(player)
    injure(player)
    injure(player)
  end
end

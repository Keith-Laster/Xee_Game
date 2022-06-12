require_relative 'user_input'
require_relative 'combat'
require_relative 'formatting'
require_relative 'enemy'
require_relative 'defender'

module Steps
  include Combat
  include Formatting
  include Input

  def ready_fail
    puts "type 'yes' when ready."
  end

  def navigate_to_step(step)
    @step = step
  end

  # step 0
  def intro
    puts "Welcome to dead man's forest- the last place they'd ever look and therefore the only place you'll be safe.
        You're just in time, the ceremony is about to begin.
        The the bride, the groom, and the good people of our once great Kingdom welcome you- that is....
        if you're name is on the guest list."
    navigate_to_step(1)
  end

  # step 1
  def get_user_name
    puts "\nPlease scribe your full name."
    @player_name = gets.chomp.downcase
    if @player_name == 'xeenyia lor laster'
      navigate_to_step(1.2)
    else
      navigate_to_step(1.3)
    end
  end

  # step 1.2
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

  # step 1.3
  def bouncer
    puts "Ahh #{@player_name} it appears you are not on the guestlist and are therefore an emperial spy and will need to be hung. That is.. unlesss you spelled your name wrong? (try either 'xeenyia lor laster' or 'quit')"
    get_user_name
  end

  # step 2
  def create_player
    @player = Player.new("#{@player_name.capitalize}")
    puts "Welcome to dead man's forest, #{@player.name}. Your current health is #{@player.health}."
    navigate_to_step(3)
  end

  # step 3
  def woods_to_wedding
    puts "\n...The light in the distance grows with eachs step.
    And soon you hear a sound in the distance you have not heard in half an age...laughter."
    puts "But at your feet you notice a red-eyed serpant.
    Do you ('jump back' 'reach for its throat' or 'stay perfectly still'?)"
    @answer = gets.chomp.downcase
    case @answer
    when 'jump back'
      jump_back
    when 'reach for its throat'
      throat_reach
    when 'stay perfectly still'
      stay_still
    else
      mispell_bouncer
    end
    navigate_to_step(4)
  end

  # step 4
  def arrive_wedding
    puts "You step out of the dark woods into the light of the wedding.
        The first sight you see is the most handsome man west of the Breakle river
        (and the Breakle river sits at the easternmost plot on the earth).
        \nYou're told his name is Keith, son of Jerry, Lord of Ruby Gems- wise as the eldar, strong as the northern sea.
        \nWell...what will it be then? Will you woo him or will you live a life of misery apart from his embrace? (type 'woo' or 'misery, please')"
    user_input
    case @answer
    when 'woo'
      line_spacing
      navigate_to_step(5.1)
    when 'misery, please'
      puts "You could have had it all.
      The cut of his jib is so perfect that I might go after him myself. And I'm a humble narrorator!
      No? Very well."
      line_spacing
      navigate_to_step(6)
    end
  end

  # step 5.1
  def create_defender
    @defender = Defender.new('Keith', 1000, 1_000_000_000)
    puts "You're new defender is by your side - his loyalty attribute is as high as his strength attribute.
        \nYou're new defender, Keith, Son of Jerry, lord of Ruby Gems has a health of #{@defender_health} and a strenght of #{@defender_strength}"
    navigate_to_step(6)
  end

  # step 6
  def wedding_crasher
    line_spacing
    puts "Good cheer and great wine mark the scene before you.
    Just minutes until your to be ushered to your seats you notice just how peacful it all seems.
    Yo're heart begins to pound against your chest.
    You know there is no such thing as peace in this world - only the allusion of it.
    ...
    The first arrow crashes through the heart of the guest to your left. The empiral swine have come.
    One beast, a cavern dweller, has made his way directly toward you.\n..."

    @enemy = Enemy.new('goblin', 40)
    puts " The #{@enemy.species} is approaching with a health of #{@enemy.health}."

    i = 0
    while @player.health > 0 && @enemy.health > 0
      break if @answer == 'exit'
      # This didnt work as expected - gohst of enemy still attacks
      break if @player.health < 0 || @enemy.health < 0

      puts 'NEXT ATTACK' if i != 0
      puts "What will you do? Do you kick it, headbutt it, or throw you're wine in it's face?
      (scribe: 'kick' 'headbutt' or 'wine him'"
      puts 'TESTY TESTY' while @defender_name == 'Keith'
      user_input
      case @answer
      when 'kick'
        attack($attack_type[:kick])
      when 'headbutt'
        attack($attack_type[:headbutt])
      when 'wine him'
        wine_him
      else
        mispell_bouncer
      end
      enemy_move
      i += 1
    end
    navigate_to_step(7)
  end

  def A_choice
    puts 'You '
  end
end

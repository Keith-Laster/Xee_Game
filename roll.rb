class Roll
  attr_accessor :roll

  def roll
    @roll = rand(1..2)
    @roll
  end

  def die_of_destiny
    puts "The die of destiny has spoken... You rolled a #{$print_die_roll}"
  end

  def self.roll_die
    die_roll = Roll.new
    $print_die_roll = die_roll.roll
    puts "scribe 'roll' when ready"
    user_input
    if @answer == 'roll'
      line_spacing
    else
      roll_fail
    end
  end

  def roll_score(score)
    die_of_destiny
    puts $print_die_roll
    if $print_die_roll.between?(1, score)
      injure(@player)
    else
      formiddable_move
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

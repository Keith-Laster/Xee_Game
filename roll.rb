require_relative 'user_input'
require_relative 'formatting'

class Roll
  attr_accessor :roll
  attr_reader :roll_required

  include Input
  include Formatting

  def roll
    @roll = rand(1..6)
    @roll
  end

  def self.roll_die
    die_roll = Roll.new
    $print_die_roll = die_roll.roll
  end

  if __FILE__ == $0
    roll_test = Roll.roll_die
    puts roll_test
  end
end

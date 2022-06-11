require_relative 'user_input'
require_relative 'formatting'

class Roll
  attr_accessor :roll

  include Input
  include Formatting

  # Had to copy and define again here for scope reasons unkown- ask the maestro
  def input
    @answer = gets.chomp.downcase
  end

  def roll
    @roll = rand(1..6)
    @roll
  end

  if __FILE__ == $0
    roll_test = Roll.roll_die
    puts roll_test
  end
end

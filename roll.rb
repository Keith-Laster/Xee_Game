class Roll
  attr_accessor :roll

  def roll
    @roll = rand(1..2)
    @roll
  end
end

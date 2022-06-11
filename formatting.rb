module Formatting
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
end

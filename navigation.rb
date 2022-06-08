require_relative 'xee_player'
require_relative 'roll'
require_relative 'defender'
require_relative 'game'

class Navigation
include Game

  def initialize(title)
    @title = title
    @answer = ''
    @step = 0
    @player
    @defender
  end

  def navigation
    loop do
      break if @answer == 'exit'

      jump_to

      case @step
      when 0
        intro
      when 1
        get_user_name
      when 1.2
        play
      when 1.3
        bouncer
      when 2
        create_player
      when 3
        woods_to_wedding
      when 4
        arrive_wedding
      when 5.1
        create_defender
      when 5.2
        # add defenderless route from here
        program_end
      end
      problem_finder
    end
  end

  def jump_to
    puts @answer
    case @answer
    when 'tw1'
      @step = 1
    when 'tw2'
      @step = 2
    when 'tw3'
      @step = 3
    when 'tw4'
      @step = 4
    end
  end

  def problem_finder
    a = 1
    a_plus = a += 1
    puts "THIS IS PRINTING -- THIS IS PRINTING -- THIS IS PRINTING -- THIS IS PRINTING #{a_plus} "
  end

  

  def program_end
    puts 'PROGRAM END PROGRAM END PROGRAM END'
    user_input
  end
end

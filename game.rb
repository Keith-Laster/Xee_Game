require_relative 'xee_player'



class Game
  
  def initialize(title)
    @title = title
    @answer = ""
  end
  
  def intro
    puts "Welcome to dead man's forest- the last place they'd ever look and therefore the only place you'll be safe. 
    You're just in time, the ceremony is about to begin. 
    The the bride, the groom, and the good people of our once great Kingdom welcome you- that is.... if you're name is on the guest list."
    puts "\nPlease scribe your full name."

    @answer = gets.chomp.downcase
    loop do
      case @answer
        when "xeenyia lor laster"
      #Add choose your race class here
      puts "Welcome, daughter of Nhia Vue. Step into the forest. Beyond the darkness you see now, you'll find light. The bride is anxious to see you."
      puts "......."
      #2 games? Ask Kyle how he would fix this
      into_the_forrest = Game.new("into the forest")
      into_the_forrest.play
        break
  
        when 'quit', 'exit'
          break
        else
      puts "Ahh #{@answer} it appears you are not on the guestlist and are therefore an emperial spy and will need to be hung. That is.. unlesss you spelled your name wrong? (try either 'xeenyia lor laster' or 'quit')"
          break
        end
    end
  end
  
  
  def play
   puts "\nAre you ready to enter the dark forest? (scribe 'yes' or 'no')" 
   enter_forest
  end
 
  def enter_forest
     loop do
      answer2 = gets.chomp.downcase
        case answer2
      when "yes"
         player = Player.new("#{@answer.capitalize}")
        puts "Welcome to dead man's forest, #{player.name}. Your current health is #{player.health}."
     arrive_wedding(player) 
   else 
      puts "please type 'yes' when ready"
      end
        end
  end
      
  
  def arrive_wedding(apple)
    puts "\nu...the light in the distance grows with eachs step. And soon you hear a sound you have not heard in half an age - laughter."
    puts "But at your feet you notice a red-eyed serpant. Do you ('jump back' 'reach for its throat' or 'stay perfectly still'?)"
    arrive_answer = gets.chomp.downcase
    case arrive_answer
    when "jump back"
      injure(apple)
    else
      puts "test"
    end
  end
  
  
  def injure(bannana)
    bannana.health -= 5
    puts "#{bannana.name} was injured. Health is now #{bannana.health}"
  end
  
end 

require_relative 'game'
require_relative 'board'
require_relative 'boardcase'
require_relative 'player'

require 'pry'

class Application
    attr_accessor :continue
  
  #initilisation des parties
    def initialize
      
      @continue = true
      while @continue == true
        Game.new
        puts "-"*30
        continue?()
      end
    end
    
   
  #méthode pour continuer
    def continue?
      puts "Voulez vous rejouer ?(o/n)"
      print "> "
      continue = gets.chomp
      until continue == "o" || continue == "n"
        puts "Merci de choisir o pour oui et n pour non"
        print "> "
        continue = gets.chomp
      end
      
      if continue == "o"
        @continue = true
      else
        @continue = false
      end
    end
  end


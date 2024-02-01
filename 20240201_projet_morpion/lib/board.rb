require_relative 'game'
require_relative 'application'
require_relative 'boardcase'
require_relative 'player'

class Board < BoardCase

    def initialize
        super
    end


    def rules
        puts "-------------------"
        puts "|  7  |  8  |  9  |"
        puts "-------------------"
        puts "|  4  |  5  |  6  |"
        puts "-------------------"
        puts "|  1  |  2  |  3  |"
        puts "-------------------"
      end



    def current_game

        puts " #{@C1} | #{@C2} | #{@C3} "
        puts "-----------"
        puts " #{@B1} | #{@B2} | #{@B3} "
        puts "-----------"
        puts " #{@A1} | #{@A2} | #{@A3} "
      end
      
end


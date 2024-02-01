require_relative 'game'
require_relative 'board'
require_relative 'application'
require_relative 'player'

class BoardCase


    attr_accessor :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3, :case

    def initialize
        @case = []
        @A1 = " "
        @case << @A1
        @A2 = " "
        @case << @A2
        @A3 = " "
        @case << @A3
        @B1 = " "
        @case << @B1
        @B2 = " "
        @case << @B2
        @B3 = " "
        @case << @B3
        @C1 = " "
        @case << @C1
        @C2 = " "
        @case << @C2
        @C3 = " "
        @case << @C3
    end

    def win (player)      
        (@A1 + @B2 + @C3) == player || (@A1 + @B1 + @C1) == player || (@A2 + @B2 + @C2) == player || (@A3 + @B3 + @C3) == player || (@C1 + @B2 + @A3) == player || (@A1 + @A2 + @A3) == player || (@B1 + @B2 + @B3) == player || (@C1 + @C2 + @C3) == player
   end

# def pour savoir si case est prise 

    def array_fetch(value)
    if (0..9).cover?(value)
        @case.fetch(value)
    end
end

# def pour savoir s'il y a égalité 

    def array_count
    @case.count{|value| value == " "}
    end 
end
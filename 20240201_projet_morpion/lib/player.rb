require_relative 'game'
require_relative 'board'
require_relative 'boardcase'
require_relative 'application'
class Player

    attr_accessor :name, :sign

    def initialize (name, sign)
        @name = name
        @sign = sign
    end

end
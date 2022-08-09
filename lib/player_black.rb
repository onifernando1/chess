require_relative "player.rb"

class PlayerBlack < Player 

    attr_accessor :name
    attr_reader :colour



    def initialize
        super 
        @colour = "black"
    end 

    def get_name

        puts "Black: Enter your name"
        super 

    end 

end 
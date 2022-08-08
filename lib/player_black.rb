require_relative "player.rb"

class PlayerBlack < Player 

    attr_accessor :name



    def initialize
        super 
    end 

    def get_name

        puts "Black: Enter your name"
        super 

    end 

end 
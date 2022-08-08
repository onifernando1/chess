require_relative "player.rb"

class PlayerWhite < Player 

    attr_accessor :name

    def initialize
        super 
    end 

    def get_name

        puts "White: Enter your name"
        super 

    end 

end 
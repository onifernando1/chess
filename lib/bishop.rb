require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Bishop < Piece

    attr_accessor :symbol, :colour 
    
    def initialize(current_board, colour="white")
        super
        @string = " \u265D " 
        # @colour = colour 
        # @symbol =  @string.encode("utf-8").light_white
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 


    def move(x=7, y=2)

        super
    end 


    def change_colour()
     super 
    end 

end 


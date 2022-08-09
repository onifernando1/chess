require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class King < Piece

    attr_accessor :current_position
    
    def initialize(current_board, colour="white")
        super 
        @string = " \u265A " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=4)

        super
    end 

    def change_colour()
        super 
    end 
   
end 
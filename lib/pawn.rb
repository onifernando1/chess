require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol
    
    def initialize(current_board, colour="white")
        super

        @string = " \u265F " 
        @symbol =  @string.encode("utf-8").light_white
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=6, y=0)

        super
    end 

    def change_colour()
     
        super() 
    end 
end 

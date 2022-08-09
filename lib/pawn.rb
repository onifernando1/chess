require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol, :current_position
    
    def initialize(current_board, colour="white")
        super

        @string = " \u265F " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        @first_move = true 
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
        potential_moves()
    end 

    def move(x=6, y=0)

        super
    end 

    def change_colour()
     
        super() 
    end 

    def potential_moves
        # note swapped later because of 
        @potential_x = [+1]

        @potential_y = [0]

    end 
end 

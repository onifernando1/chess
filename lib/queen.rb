require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Queen < Piece

    attr_accessor :symbol, :colour, :string, :current_position

    def initialize(current_board, colour="white")
        super 

        @string = " \u265B " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=3)

        super
    end 

    def change_colour()
        super 
    end 

    def potential_moves

        @potential_x = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0,-1,-1,+1,+1,-2,-2,+2,+2,-3,-3,+3,+3,-4,-4,+4,+4,-5,-5,+5,+5,-6,-6,+6,+6,-7,-7,+7,+7]
        @potential_y = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7,+1,-1,+1,-1,+2,-2,+2,-2,+3,-3,+3,-3,+4,-4,+4,-4,+5,-5,+5,-5,+6,-6,+6,-6,+7,-7,+7,-7]

    end 
end 

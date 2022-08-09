require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Rook < Piece

    attr_accessor :string, :symbol, :current_position

    def initialize(current_board, colour="white")
        super
        @string = " \u265C " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=0)
        super
    end 

    def change_colour()
        super 
    end 

    def potential_moves

        @potential_x = [+2, +2, -2, -2, +1, +1, -1, -1]
        @potential_x = [+1, -1, +1, -1, +2, -2, +2, -2]

    end 
end 
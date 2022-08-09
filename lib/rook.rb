require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Rook < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y

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
        
        @potential_x = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0]
        @potential_y = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7]
    
    end 

    def delete_old_move
        super()
    end 

    def find_player 
        super 
    end 
end 


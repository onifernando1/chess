require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Bishop < Piece

    attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :path_blocked, :current_pieces

    
    def initialize(current_board, colour="white")
        super
        @string = " \u265D " 
        # @colour = colour 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()


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

    def potential_moves

        @potential_x = [-1,-1,+1,+1,-2,-2,+2,+2,-3,-3,+3,+3,-4,-4,+4,+4,-5,-5,+5,+5,-6,-6,+6,+6,-7,-7,+7,+7]
        @potential_y = [+1,-1,+1,-1,+2,-2,+2,-2,+3,-3,+3,-3,+4,-4,+4,-4,+5,-5,+5,-5,+6,-6,+6,-6,+7,-7,+7,-7]

    end 

    def delete_old_move
        super()
    end 

    def find_player(end_co_ordinates)
        super()
    end 

end 


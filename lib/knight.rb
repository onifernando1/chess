require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Knight < Piece

    def initialize(current_board, colour="white")
        @string = " \u265E " 
        super 
        # @symbol =  @string.encode("utf-8").light_white
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def possible_moves(xx, yy)

        #possible moves of knight 

        x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
        y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]

        for i in (0..7)
            x = xx + x_coordinates[i]
            y = yy + y_coordinates[i]
            puts "#{x},#{y}"
        end 

    end

    def move(x=7, y=1)

        # if @current_board[x][y] == @black_square
        #     @current_board[x][y] = @symbol.colorize(background: :light_magenta)
        # elsif @current_board[x][y] == @white_square
        #     @current_board[x][y] = @symbol.colorize(background: :light_cyan)
        # end 
        super
    end 

    def change_colour()
        super 
    end 
end 
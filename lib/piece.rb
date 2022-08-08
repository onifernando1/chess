require_relative "board.rb"
require 'colorize'

class Piece
    attr_accessor :colour 

    def initialize(current_board, colour="white")
        @current_board = current_board.board
        @colour = colour
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white


    end 

    def move(x=3, y=3)

        if @current_board[x][y] == @black_square
            @current_board[x][y] = @symbol.colorize(background: :light_magenta)
        elsif @current_board[x][y] == @white_square
            @current_board[x][y] = @symbol.colorize(background: :light_cyan)
        end 
    end 

    def change_colour()
        if @colour == "black"
            @symbol = @string.encode("utf-8").black
        else
            puts "a" # change this 
        end  

    end 
end 
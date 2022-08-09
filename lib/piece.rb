require_relative "board.rb"
require 'colorize'

class Piece
    attr_accessor :string, :symbol, :current_position, :colour

    def initialize(current_board, colour="white")
        @current_board = current_board.board
        @colour = colour
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]


    end 

    def move(x=3, y=3)

        if @current_board[x][y] == @black_square
            @current_board[x][y] = @symbol.colorize(background: :light_magenta)
            
            if @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_magenta) || @current_board[@current_position[0]][@current_position[1]] == @black_square
                @current_board[@current_position[0]][@current_position[1]] = @black_square
            elsif @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_cyan) || @current_board[@current_position[0]][@current_position[1]] == @white_square
                @current_board[@current_position[0]][@current_position[1]] = @white_square
            end 

            @current_position[0] = x 
            @current_position[1] = y 

        elsif @current_board[x][y] == @white_square
            @current_board[x][y] = @symbol.colorize(background: :light_cyan)
            if @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_magenta) || @current_board[@current_position[0]][@current_position[1]] == @black_square
                @current_board[@current_position[0]][@current_position[1]] = @black_square
            elsif @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_cyan) || @current_board[@current_position[0]][@current_position[1]] == @white_square
                @current_board[@current_position[0]][@current_position[1]] = @white_square
            end 

            @current_position[0] = x 
            @current_position[1] = y 
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
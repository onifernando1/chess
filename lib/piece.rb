require_relative "board.rb"
require 'colorize'

class Piece
    attr_accessor :string, :symbol, :current_position, :colour

    def initialize(current_board, colour="white", current_pieces="default")
        @current_board = current_board.board
        @colour = colour
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [4,4]
        @current_pieces = current_pieces


    end 

    

    def move(x, y) # move colour stuff into new function?

        if @current_board[x][y] == @black_square
               
            @current_board[x][y] = @symbol.colorize(background: :light_magenta)

            @current_position[0] = x 
            @current_position[1] = y 

        elsif @current_board[x][y] == @white_square

            @current_board[x][y] = @symbol.colorize(background: :light_cyan)

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

    def delete_old_move
        if @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_magenta)
            @current_board[@current_position[0]][@current_position[1]] = @black_square
            puts "DELETED A "
        elsif @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_cyan) 
            @current_board[@current_position[0]][@current_position[1]] = @white_square
            puts "DELETED B"
        end 
    end 

    def find_player(end_co_ordinates)
        
            @piece = []
            @current_pieces.each do |piece|
             if piece.current_position == end_co_ordinates
                 puts piece 
                 puts piece.current_position
                 puts "YAY"
                 @piece = piece
             end 
             
            #  end 
     
            #  puts "FINAL PIECE"
            #  puts @piece_selected
            #  puts @piece_selected.current_position
     

    end 
end 
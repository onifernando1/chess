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
        elsif @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_cyan) 
            @current_board[@current_position[0]][@current_position[1]] = @white_square
        end 
    end 

    def find_player(end_co_ordinates)
        
            @piece = ""
            @current_pieces.each do |piece|
             if piece.current_position == end_co_ordinates
                 @piece = piece
             end 
            end 
            @piece
             

    end 


    def check_destination(end_co_ordinates, current_player) 
        #e.g youre given start coordinates E1
        # end coordinates E2 
        # piece in your way ;. cant move 
        # start coords unecessaary but for ease of using method all the time keep all methods the same 
        # take out once sorted if x== queen / rook / bishop
        # start_x = start_co_ordinates[0]
        # start_y = start_co_ordinates[1]
        end_x = end_co_ordinates[0]
        end_y = end_co_ordinates[1]  

        if @current_board[end_x][end_y] != @black_square || @current_board[end_x][end_y] != @white_square

            @destination_player = find_player(end_co_ordinates)  
          
        end 

         
        if @current_board[end_x][end_y] == @black_square || @current_board[end_x][end_y] == @white_square
            @path_blocked = false 
        elsif @destination_player.colour == current_player.colour  # find piece 
            @path_blocked = true 
        else # take 
            puts "Piece taken !"
            @path_blocked = false 
        end  
        
    end 
end 
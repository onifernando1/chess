require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y, :current_pieces
    
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
        @potential_x = [-1]

        @potential_y = [0]

    end 

    def delete_old_move
        super()
    end 

    def find_player 
        super 
    end 

    def find_path(start_co_ordinates, end_co_ordinates, current_player)
        #e.g youre given start coordinates E1
        # end coordinates E2 
        # piece in your way ;. cant move 
        # start coords unecessaary but for ease of using method all the time keep all methods the same 
        start_x = start_co_ordinates[0]
        start_y = start_co_ordinates[1]
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
            puts "TIME TO TAKE PIECE"
            @path_blocked = false 
        end  
        
    end 
end 

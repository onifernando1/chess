require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked, :first_move
    
    def initialize(current_board, colour="white")
        super

        @string = " \u265F " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        @first_move = true 
        @path_blocked = false 
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
        # potential_moves()
    end 

    def move(x=6, y=0)

        super
    end 

    def change_colour()
     
        super() 
    end 

    def potential_moves
        # note swapped later because of 
        if @colour == "white"
            if @first_move == true 
                @potential_x = [-1,-2]
                @potential_y = [0,0]
            else 
                @potential_x = [-1]
                @potential_y = [0]
            end 
        else 
            if @first_move == true 
                @potential_x = [+ 1,+2]
                @potential_y = [0,0]
            else 
                @potential_x = [+1]
                @potential_y = [0]
            end 
        end 

    end 

    def delete_old_move
        super()
    end 

    def find_player(end_co_ordinates)
        super(end_co_ordinates)
    end 


    def check_destination(end_co_ordinates, current_player) 

        super(end_co_ordinates, current_player  )

    end 

    def plot_path()
        @path = []

        current_x = @current_position[0] 
        current_y = @current_position[1]

        @path << current_x + @potential_x[0] 
        @path << current_y + @potential_y[0]
        @path

    end 

    def check_if_piece_blocking_path

        @path_blocked_array = []
                     
        move_x = @path[0]
        move_y = @path[1]
   

        if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square
    
            @destination_player = find_player(move)
        end 
            
        if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square

                @path_blocked_array << false 
            else
                @path_blocked_array << true 
            end  



            if @path_blocked_array.include?(true)
                @path_blocked = true 
            end 

        end 
end 

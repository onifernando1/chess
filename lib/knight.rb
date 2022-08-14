require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'tree.rb'
require_relative 'node.rb'
require 'colorize'


class Knight < Piece
    attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked

    def initialize(current_board, colour="white")
        super 

        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()
        @path_blocked = false 

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

    def potential_moves

        @potential_x = [+2, +2, -2, -2, +1, +1, -1, -1]
        @potential_y = [+1, -1, +1, -1, +2, -2, +2, -2]

    end 

    def delete_old_move
        super()
    end 

    def find_player(end_co_ordinates)
        super(end_co_ordinates)
    end 

    # def find_path(start_co_ordinates, end_co_ordinates, current_player)
    #     #e.g youre given start coordinates E1
    #     # end coordinates E2 
    #     # piece in your way ;. cant move 
    #     # start coords unecessaary but for ease of using method all the time keep all methods the same 
    #     start_x = start_co_ordinates[0]
    #     start_y = start_co_ordinates[1]
    #     end_x = end_co_ordinates[0]
    #     end_y = end_co_ordinates[1]  

    #     if @current_board[end_x][end_y] != @black_square || @current_board[end_x][end_y] != @white_square

    #         @destination_player = find_player(end_co_ordinates)  
          
    #     end 

         
    #     if @current_board[end_x][end_y] == @black_square || @current_board[end_x][end_y] == @white_square
    #         @path_blocked = false 
    #     elsif @destination_player.colour == current_player.colour  # find piece 
    #         @path_blocked = true 
    #     else # take 
    #         puts "TIME TO TAKE PIECE"
    #         @path_blocked = false 
    #     end  
        
    # end 

    def check_destination(end_co_ordinates, current_player) 
        super(end_co_ordinates, current_player  )
    end 
end 
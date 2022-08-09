require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'bst.rb'
require 'colorize'


class Queen < Piece

    attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked

    def initialize(current_board, colour="white")
        super 

        @string = " \u265B " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=3)

        super
    end 

    def change_colour()
        super 
    end 

    def potential_moves

        @potential_x = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0,-1,-1,+1,+1,-2,-2,+2,+2,-3,-3,+3,+3,-4,-4,+4,+4,-5,-5,+5,+5,-6,-6,+6,+6,-7,-7,+7,+7]
        @potential_y = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7,+1,-1,+1,-1,+2,-2,+2,-2,+3,-3,+3,-3,+4,-4,+4,-4,+5,-5,+5,-5,+6,-6,+6,-6,+7,-7,+7,-7]

    end 

    def delete_old_move
        super()
    end 

    def find_player(end_co_ordinates) 
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

    def plot_path

           #get start and move base moves until destination reached, that will dform path, check all coordinates on path for pieces 

           base_move_x =  [+1,-1,0,0]
           base_move_y =[0,0,-1,+1]
   
           until path_x == end_x && path_y == end_y 
               for i in (0..3)
                   path_x = start_x + base_move_x[i]
                   start_x = path_x
                   path_y = start_y + base_move_y[i]
                   start_y = path_y
               end 
               puts "YAY"
           end 
   
           puts "YAY"
   
   
    end 
end 

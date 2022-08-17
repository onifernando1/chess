require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'tree.rb'
require_relative 'node.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked, :first_move, :black_square, :white_square, :checking_king, :position_to_check_path
    
    def initialize(current_board, colour="white")
        super

        @string = " \u265F " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        @first_move = true 
        @path_blocked = false 
        @checking_king = false 

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
        potential_moves()
    end 

    def move(x=6, y=0)

        super
    end 



    def potential_moves
        # note swapped later because of 
        if @colour == "white"
            if @first_move == true 
                @potential_x = [-1,-2,-1,-1]
                @potential_y = [0,0,-1,+1]
            else 
                @potential_x = [-1,-1,-1]
                @potential_y = [0,-1,1]
            end 
        else 
            if @first_move == true 
                @potential_x = [+ 1,+2,+1,+1]
                @potential_y = [0,0,+1,-1]
            else 
                @potential_x = [+1,+1,+1]
                @potential_y = [0,+1,-1]
            end 
        end 

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


    def find_moves_to_check

        potential_moves() # only if diag

        @final_positions_to_check = []

        current_x = @current_position[0]
        current_y = @current_position[1]

        length_to_check = @potential_x.length - 1 

        for i in ((length_to_check -1 )..length_to_check) # only if diag 
            
            @co_ords_to_check = []

            next_move_x = current_x + @potential_x[i]
            @co_ords_to_check << next_move_x

            next_move_y = current_y + @potential_y[i]
            @co_ords_to_check << next_move_y

            @final_positions_to_check << @co_ords_to_check


        end 

        @final_positions_to_check


    end 

    def find_a_king(end_co_ordinates, current_player)
        
            @current_pieces.each do |piece|
                if piece.current_position == end_co_ordinates && piece.class == King# && piece.colour != current_player.colour
                        @piece = piece
                end 
            end 
            @piece
    
                 
    
    end 

    # def check_for_check(current_player, white_king, black_king) # add in stuff form piece method later

    #     @checking_king = false 

    #     find_moves_to_check()

    #     @final_positions_to_check.each do |co_ords|

    #         @potential_king = find_a_king(co_ords, current_player)


    #         if @potential_king != nil 
    #             @checking_king = true 
    #         end 



    #     end 

         
    # end 

    def check_for_check(current_player, white_king, black_king)


        @checking_king = false 

        find_moves_to_check()
       

        if current_player.colour == "white"
            current_king = white_king
        else 
            current_king = black_king
        end 


        
        king_found =  @final_positions_to_check.include?(current_king.current_position)

      
        if king_found == true 
            @checking_king = true 

        end 

       

         
    end

end  


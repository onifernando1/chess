require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'tree.rb'
require_relative 'node.rb'
require 'colorize'


class Pawn < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked, :first_move, :black_square, :white_square, :checking_king, :position_to_check_path, :end_positions
    
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
        get_end_positions()
        @second_move = nil 
        @third_move = nil 
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

    def get_end_positions

        if @colour == "white"

         @end_positions = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]]

        else 
            @end_positions = [[7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]

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

    def check_destination(end_co_ordinates, current_player) 

        @take = false 


        #e.g youre given start coordinates E1
        # end coordinates E2 
        # piece in your way ;. cant move 
        # start coords unecessaary but for ease of using method all the time keep all methods the same 
        # take out once sorted if x== queen / rook / bishop
        # start_x = start_co_ordinates[0]
        # start_y = start_co_ordinates[1]
        end_x = end_co_ordinates[0]
        end_y = end_co_ordinates[1]  

        


        if @current_board[end_x][end_y] != @black_square && @current_board[end_x][end_y] != @white_square
            @destination_player = find_player(end_co_ordinates)  
            
            if @destination_player.colour == current_player.colour  # find piece 
                @path_blocked = true 
                "Puts path blocked :("
            elsif @destination_player.colour != current_player.colour && end_y != @current_position[1]# take
                puts "OH OH " 
                @path_blocked = false 
                @take = true 
            else 
                @path_blocked = true 
            end  
            
          
        end 

         
        if @current_board[end_x][end_y] == @black_square || @current_board[end_x][end_y] == @white_square
            @path_blocked = false 
        end 

       

     
    end

end  


require_relative "board.rb"
require_relative 'player.rb'
require_relative 'player_black.rb'
require_relative 'player_white.rb'


require 'colorize'

class Piece
    attr_accessor :string, :symbol, :current_position, :colour, :take, :black_square, :white_square, :in_check

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
        p "END CO FIND PL#{end_co_ordinates}"
        p "above me endoc from fp "
        @current_pieces.each do |piece|
            if piece.current_position == end_co_ordinates
                @piece = piece
            end 
        end 
        @piece

             

    end 

    def delete_destination(destination_co_ords)

        destination_x = destination_co_ords[0]
        destination_y = destination_co_ords[1]


        puts "DELETE DEST CALLED "
        puts @current_board[destination_x][destination_y]
        p @current_board[destination_x][destination_y]

        if @current_board[destination_x][destination_y] == @symbol.colorize(background: :light_magenta)
            puts "IF "
            @current_board[destination_x][destination_y] = @black_square

        elsif @current_board[destination_x][destination_y] == @symbol.colorize(background: :light_cyan) 
            puts "ELSFI"
            @current_board[destination_x][destination_y] = @white_square
        end 

    end 

  


    def check_destination(end_co_ordinates, current_player) 

        @take = false 

        p "END CO CHECK DESST#{end_co_ordinates}"

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
            p "below me "
            p @destination_player
            if @destination_player.colour == current_player.colour  # find piece 
                @path_blocked = true 
                "Puts path blocked :("
            elsif @destination_player.colour != current_player.colour # take 
                puts "Piece taken !"
                @path_blocked = false 
                @take = true 
            end  
            
          
        end 

         
        if @current_board[end_x][end_y] == @black_square || @current_board[end_x][end_y] == @white_square
            @path_blocked = false 
        end 

     
    end 

    def find_moves_to_check

        @final_positions_to_check = []

        current_x = @current_position[0]
        current_y = @current_position[1]

        length_to_check = @potential_x.length - 1 

        for i in (0..length_to_check)
            
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

                if piece.colour == current_player.colour 

                    if piece.current_position == end_co_ordinates && piece.class == King && piece.colour != current_player.colour
                            @piece = piece
                            puts "IMPORTANT BELOW ME "
                            p @final_positions_to_check

                            puts piece 
                            p piece.current_position
                            p "END CO #{end_co_ordinates}"
                            puts "IMPORTANT ABOVE ME "
                    end 
                end 
            end 
            @piece
    
                 
    
    end 

    def check_for_check(current_player)

        @in_check = false 

        find_moves_to_check()

        @final_positions_to_check.each do |co_ords|
            
            @potential_king = find_a_king(co_ords, current_player)

            
            if @potential_king != nil 
                puts "IN LOOP"
                puts @potential_king
                puts @potential_king.current_position
                @in_check = true 
                puts "CHECK!"
            # else 
            #     puts "NOT IN CHECK!"
            end 
        end 

         
    end 
end 
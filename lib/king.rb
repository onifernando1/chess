require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'bishop.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'rook.rb'
require_relative 'player.rb'
require_relative 'player_white.rb'
require_relative 'player_black.rb'
require_relative 'tree.rb'
require_relative 'node.rb'
require 'colorize'


class King < Piece

    attr_accessor :current_position, :potential_x, :potential_y, :path_blocked, :current_pieces, :in_check, :position_to_check_path

    def initialize(current_board, colour="white")
        super 
        @string = " \u265A " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()
        @path_blocked = false 
        @in_check = false 
        # @current_pieces = []
        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=4)

        super
    end 

    def potential_moves
       
        @potential_x = [+1,-1,0,0,-1,-1,+1,+1]
        @potential_y = [0,0,-1,+1,+1,-1,+1,-1]
    
    end 

   
    # def find_moves_to_check

    #     @final_positions_to_check = []

    #     current_x = @current_position[0]
    #     current_y = @current_position[1]
    #     p "CURRENT X #{current_x}" 

    #     length_to_check = @potential_x.length - 1 

    #     for i in (0..length_to_check)
            
    #         @co_ords_to_check = []

    #         next_move_x = current_x + @potential_x[i]
    #         @co_ords_to_check << next_move_x

    #         next_move_y = current_y + @potential_y[i]
    #         @co_ords_to_check << next_move_y

    #         @final_positions_to_check << @co_ords_to_check

    #     end 


    #     p @final_positions_to_check

    # end 

    # def find_a_king(end_co_ordinates, current_player)
        
    #         @current_pieces.each do |piece|
    #             if piece.current_position == end_co_ordinates && piece.class == King && piece.colour != current_player.colour
    #                     @piece = piece
    #             end 
    #         end 
    #         @piece
    
                 
    
    # end 

    # def check_for_check(current_player)

    #     @in_check = false 

    #     find_moves_to_check()

    #     @final_positions_to_check.each do |co_ords|

    #         @potential_king = find_a_king(co_ords, current_player)

    #         if @potential_king != nil 
    #             @in_check = true 
    #             puts "CHECK!"
    #         # else 
    #         #     puts "NOT IN CHECK!"
    #         end 
    #     end 

         
    # end 

   
end 

class KingTree < Tree

end 
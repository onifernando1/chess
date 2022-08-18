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

    attr_accessor :current_position, :potential_x, :potential_y, :path_blocked, :current_pieces, :checking_king, :position_to_check_path

    def initialize(current_board, colour="white")
        super 
        @string = " \u265A " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()
        @path_blocked = false 
    end 

    def move(x=7, y=4)

        super
    end 

    def potential_moves
       
        @potential_x = [+1,-1,0,0,-1,-1,+1,+1]
        @potential_y = [0,0,-1,+1,+1,-1,+1,-1]
    
    end 


    
   
end 


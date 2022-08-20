# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'king'
require_relative 'rook'
require_relative 'player'
require_relative 'player_white'
require_relative 'player_black'
require_relative 'tree'
require_relative 'node'
require 'colorize'

class King < Piece
  attr_accessor :current_position, :potential_x, :potential_y, :path_blocked, :current_pieces, :checking_king,
                :position_to_check_path

  def initialize(current_board, colour = 'white')
    super
    @string = " \u265A "
    @symbol = @string.encode('utf-8').light_white
    @current_position = [0, 0]
    potential_moves
    @path_blocked = false
  end

  def move(x = 7, y = 4)
    super
  end

  def potential_moves
    @potential_x = [+1, -1, 0, 0, -1, -1, +1, +1]
    @potential_y = [0, 0, -1, +1, +1, -1, +1, -1]
  end
end

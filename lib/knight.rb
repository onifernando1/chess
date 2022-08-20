# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'tree'
require_relative 'node'
require 'colorize'

class Knight < Piece
  attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :current_pieces,
                :path_blocked, :checking_king, :position_to_check_path

  def initialize(current_board, colour = 'white')
    super

    @string = " \u265E "
    @symbol = @string.encode('utf-8').light_white
    @current_position = [0, 0]
    potential_moves
    @path_blocked = false
  end

  def possible_moves(xx, yy)
    # possible moves of knight

    x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
    y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]

    (0..7).each do |i|
      x = xx + x_coordinates[i]
      y = yy + y_coordinates[i]
      puts "#{x},#{y}"
    end
  end

  def move(x = 7, y = 1)
    super
  end

  def potential_moves
    @potential_x = [+2, +2, -2, -2, +1, +1, -1, -1]
    @potential_y = [+1, -1, +1, -1, +2, -2, +2, -2]
  end
end

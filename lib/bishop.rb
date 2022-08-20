# frozen_string_literal: true

require_relative 'board'
require_relative 'piece'
require_relative 'tree'
require_relative 'node'
require 'colorize'
require_relative 'bst'

class Bishop < Piece
  attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :path_blocked,
                :current_pieces, :checking_king, :position_to_check_path

  def initialize(current_board, colour = 'white')
    super
    @string = " \u265D "
    @symbol = @string.encode('utf-8').light_white
    @current_position = [0, 0]
    potential_moves
    @path_blocked = nil
  end

  def move(x = 7, y = 2)
    super
  end

  def potential_moves
    @potential_x = [-1, -1, +1, +1, -2, -2, +2, +2, -3, -3, +3, +3, -4, -4, +4, +4, -5, -5, +5, +5, -6, -6, +6, +6,
                    -7, -7, +7, +7]
    @potential_y = [+1, -1, +1, -1, +2, -2, +2, -2, +3, -3, +3, -3, +4, -4, +4, -4, +5, -5, +5, -5, +6, -6, +6, -6,
                    +7, -7, +7, -7]
  end

  def set_up_path(starting_x, starting_y, ending_x, ending_y)
    tree = BishopTree.new
    tree.minim_steps(starting_x, starting_y, ending_x, ending_y)
    @path = tree.print_path
    @path
  end

  # move to piece
  def check_if_piece_blocking_path
    @path_blocked = false

    @path_blocked_array = []

    if @path.length >= 2 # change to equal two
      @path.each do |move|
        move_x = move[0]
        move_y = move[1]

        if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square

          @destination_player = find_player(move)
        end

        if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square

          @path_blocked_array << false
        else
          @path_blocked_array << true
        end
      end

      @path_blocked = true if @path_blocked_array.include?(true)

    elsif @path.length == 1 # change to 1

      move_x = @path[0][0]
      move_y = @path[0][1]
      new_move = []
      new_move << move_x
      new_move << move_y

      if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square

        @destination_player = find_player(new_move)
      end

      if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square

        @path_blocked_array << false
      else
        @path_blocked_array << true
      end

      @path_blocked = true if @path_blocked_array.include?(true)

    end
  end

  def plot_path(starting_x, starting_y, ending_x, ending_y)
    set_up_path(starting_x, starting_y, ending_x, ending_y)
    check_if_piece_blocking_path
  end
end

class BishopTree < Tree
  attr_accessor :queue, :moves, :path, :continue, :distance, :current_node, :node

  def minim_steps(x_start, y_start, x_end, y_end)
    # possible moves of bishop base  # if it starts using diagonals to cut, if x increase then do these moves: etc.

    @x_coordinates = [-1, -1, +1, +1]
    @y_coordinates = [+1, -1, +1, -1]

    # matrix to track visited spaces

    matrix = [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false]
    ]

    visited = matrix

    # root = add_node(x_start, y_start, 0)
    # pointer
    @current_node = add_node(x_start, y_start, 0)
    node_number = 0

    # set start root node to visited
    visited[x_start][y_start] = true

    until @current_node.x == x_end && @current_node.y == y_end # ||@current_node.y > 7 && @current_node.y < 0 && @current_node.x < 0 && @current_node.x > 7

      # go through possible moves

      length_of_potential_moves = @y_coordinates.length - 1

      (0..length_of_potential_moves).each do |i|
        x = @current_node.x + @x_coordinates[i]
        y = @current_node.y + @y_coordinates[i]

        if move_valid?(x, y) && visited[x][y] == false
          visited[x][y] = true
          @moves << add_node(x, y, @current_node.distance + 1, @current_node)
        end
      end

      # move to next node in @nodes
      node_number += 1
      @current_node = @queue[node_number]
      # visited = matrix

    end
    visited = matrix
  end
end

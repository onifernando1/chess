# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'player_black'
require_relative 'player_white'

require 'colorize'

class Piece
  attr_accessor :string, :symbol, :current_position, :colour, :take, :black_square, :white_square, :checking_king,
                :final_positions_to_check, :potential_king, :sorted_moves, :promoted

  def initialize(current_board, colour = 'white', current_pieces = 'default')
    @current_board = current_board.board
    @colour = colour
    @white_square = '   '.colorize(background: :light_cyan)
    @black_square = '   '.colorize(background: :light_magenta)
    @string = " \u265E "
    @symbol = @string.encode('utf-8').light_white
    @current_position = [4, 4]
    @current_pieces = current_pieces
    @checking_king = false
    @promoted = false
  end

  # move colour stuff into new function?
  def move(x, y)
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

  def change_colour
    @symbol = @string.encode('utf-8').black if @colour == 'black'
  end

  def delete_old_move
    if @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_magenta)
      @current_board[@current_position[0]][@current_position[1]] = @black_square

    elsif @current_board[@current_position[0]][@current_position[1]] == @symbol.colorize(background: :light_cyan)
      @current_board[@current_position[0]][@current_position[1]] = @white_square
    end
  end

  def find_player(end_co_ordinates)
    @current_pieces.each do |piece|
      @piece = piece if piece.current_position == end_co_ordinates
    end
    @piece
  end

  def delete_destination(destination_co_ords)
    destination_x = destination_co_ords[0]
    destination_y = destination_co_ords[1]

    if @current_board[destination_x][destination_y] == @symbol.colorize(background: :light_magenta)
      @current_board[destination_x][destination_y] = @black_square

    elsif @current_board[destination_x][destination_y] == @symbol.colorize(background: :light_cyan)
      @current_board[destination_x][destination_y] = @white_square
    end
  end

  def check_destination(end_co_ordinates, current_player)
    @take = false

    end_x = end_co_ordinates[0]
    end_y = end_co_ordinates[1]

    if @current_board[end_x][end_y] != @black_square && @current_board[end_x][end_y] != @white_square
      @destination_player = find_player(end_co_ordinates)

      if @destination_player.colour == current_player.colour # find piece
        @path_blocked = true
      elsif @destination_player.colour != current_player.colour # take
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

    (0..length_to_check).each do |i|
      @co_ords_to_check = []

      next_move_x = current_x + @potential_x[i]
      next_move_y = current_y + @potential_y[i]

      next unless next_move_x <= 7 && next_move_x >= 0 && next_move_y <= 7 && next_move_y >= 0

      @co_ords_to_check << next_move_x

      @co_ords_to_check << next_move_y

      @final_positions_to_check << @co_ords_to_check
    end

    @final_positions_to_check
  end

  def sort_king_moves(current_player)
    @sorted_moves = []

    @final_positions_to_check_copy = find_moves_to_check

    @final_positions_to_check_copy.each do |co_ord|
      if @current_board[co_ord[0]][co_ord[1]] == @black_square || @current_board[co_ord[0]][co_ord[1]] == @white_square

        @sorted_moves << co_ord
      else

        found_piece = find_player(co_ord)

        @sorted_moves << co_ord if found_piece.colour != current_player.colour
      end
    end
    @sorted_moves
  end

  def find_a_king(end_co_ordinates, current_player)
    @current_pieces.each do |piece|
      next unless piece.colour == current_player.colour

      @piece = piece if piece.current_position == end_co_ordinates && piece.instance_of?(King)
    end
    @piece
  end

  def check_for_check(current_player, white_king, black_king)
    king_found = false # reset

    @checking_king = false

    current_king = if current_player.colour == 'white'
                     white_king
                   else
                     black_king
                   end

    find_moves_to_check

    king_position = current_king.current_position
    # # puts "KING POS #{king_position}"
    # puts "#{@final_positions_to_check}"

    @final_positions_to_check.each do |location|
      next unless location == king_position
      # puts "CFC FPTC"
      # puts self.class 
      # puts self.colour 
      # p location 
      # p king_position
      # puts "CFC FPTC"


      king_found = true
      @checking_king = true
    end
  end
end

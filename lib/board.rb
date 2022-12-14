# frozen_string_literal: true

require 'colorize'
# Pseudocode

# make board 8x8 DONE
# show board DONE
# way to switch board/flip board
# reset board to array from joined DONE
# Give each piece a class: eight pawns, two bishops, two knights, two rooks, one queen, and one king. DONE
# Arrays for possible moves of pieces
# legal moves - within board limits 8x8
# if a player lands on a square and another piece is there, take it.
# add to taken pieces, remove from board
# program in checkmate and check
# remaining pieces white
# remaining pieces black
# swap current player to other player
# pawns: can jump over pieces, 1/2 if first_move = false  , pawns take diagonally
# pawn to end = queen, rook, knight, or bishop
# castle/rook: move up or down , any number of moves
# bishops: diagonal left or right :any number of moves
# knights: knight travails L
# queen: Up/down/diagonally any number of moves
# king: Up/down/diagonally one move

class Board
  attr_accessor :board

  def initialize
    make_board
    @white_square = '   '.colorize(background: :light_cyan)
    @black_square = '   '.colorize(background: :light_magenta)
    colour_board
  end

  def make_board
    @board = Array.new(8) { Array.new(8) { 'a' } }
  end

  def colour_board
    odd = [1, 3, 5, 7]
    even = [0, 2, 4, 6]

    @board.each_index do |index|
      if [0, 2, 4, 6].include?(index)
        odd.each do |i|
          @board[index][i] = @black_square
        end

        even.each do |i|
          @board[index][i] = @white_square
        end
      end

      next unless [1, 3, 5, 7].include?(index)

      odd.each do |i|
        @board[index][i] = @white_square
      end

      even.each do |i|
        @board[index][i] = @black_square
      end
    end
  end

  def add_numbers_to_board
    @numbers = [0, 1, 2, 3, 4, 5, 6, 7]
    @numbers_to_show = [8, 7, 6, 5, 4, 3, 2, 1]
    @numbers.each do |number|
      @temp[number].prepend("#{@numbers_to_show[number]} ")
      @temp[number] << (+ ' ' + @numbers_to_show[number].to_s)
    end
  end

  def add_letters_to_board
    @letters = ['   A ', ' B ', ' C ', ' D ', ' E ', ' F ', ' G ', ' H ']
    @temp.prepend(@letters)
    @temp << @letters
  end

  def join_board
    @temp = @temp.map do |array|
      array.join('')
    end
  end

  def remove_numbers_from_board
    @board = @board.each do |array|
      array.shift
      array.pop
    end
  end

  def show_board
    @temp = []
    @board.each { |array| @temp << array }

    add_numbers_to_board
    add_letters_to_board

    join_board

    puts @temp

    remove_numbers_from_board # don't know why numbers keep changing @board instead of @temp, cant reset board to temp at end for some reason
  end
end

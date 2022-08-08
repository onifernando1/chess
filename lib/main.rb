require_relative 'bishop.rb'
require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'piece.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'rook.rb'


current_board = Board.new()
current_board.show_board()
knight = Knight.new(current_board)
knight.move_knight()
current_board.show_board()
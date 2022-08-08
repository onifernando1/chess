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
piece = Piece.new(current_board)
pawn1 = Pawn.new(current_board)
pawn2 = Pawn.new(current_board)
pawn3 = Pawn.new(current_board)
pawn4 = Pawn.new(current_board)
pawn5 = Pawn.new(current_board)
pawn6 = Pawn.new(current_board)
pawn7 = Pawn.new(current_board)
pawn8 = Pawn.new(current_board)

pawn1.move()
pawn2.move(6,1)
pawn3.move(6,2)
pawn4.move(6,3)
pawn5.move(6,4)
pawn6.move(6,5)
pawn7.move(6,6)
pawn8.move(6,7)

rook1 = Rook.new(current_board)
rook2 = Rook.new(current_board)
rook1.move()
rook2.move(7,7)

knight1 = Knight.new(current_board)
knight2 = Knight.new(current_board)
knight1.move(7,1)
knight2.move(7,6)

bishop1 = Bishop.new(current_board)
bishop2 = Bishop.new(current_board)
bishop1.move()
bishop2.move(7,5)

queen = Queen.new(current_board)
queen.move()

king = King.new(current_board)
king.move()


current_board.show_board()


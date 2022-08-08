require_relative 'bishop.rb'
require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'piece.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'rook.rb'



class Game 
 

end 



current_board = Board.new()
# current_board.show_board()
piece = Piece.new(current_board)
white_pawn1 = Pawn.new(current_board)
white_pawn2 = Pawn.new(current_board)
white_pawn3 = Pawn.new(current_board)
white_pawn4 = Pawn.new(current_board)
white_pawn5 = Pawn.new(current_board)
white_pawn6 = Pawn.new(current_board)
white_pawn7 = Pawn.new(current_board)
white_pawn8 = Pawn.new(current_board)

white_pawn1.move()
puts white_pawn1.symbol 
white_pawn2.move(6,1)
white_pawn3.move(6,2)
white_pawn4.move(6,3)
white_pawn5.move(6,4)
white_pawn6.move(6,5)
white_pawn7.move(6,6)
white_pawn8.move(6,7)

white_rook1 = Rook.new(current_board)
white_rook2 = Rook.new(current_board)
white_rook1.move()
white_rook2.move(7,7)

white_knight1 = Knight.new(current_board)
white_knight2 = Knight.new(current_board)
white_knight1.move(7,1)
white_knight2.move(7,6)

white_bishop1 = Bishop.new(current_board)
white_bishop2 = Bishop.new(current_board)
white_bishop1.move()
white_bishop2.move(7,5)

white_queen = Queen.new(current_board)
white_queen.move()

white_king = King.new(current_board)
white_king.move()



black_bishop1 = Bishop.new(current_board,"black")
black_bishop2 = Bishop.new(current_board,"black")
black_bishop1.change_colour()
black_bishop2.change_colour()
black_bishop1.move(0,2)
black_bishop2.move(0,5)

black_pawn1 = Pawn.new(current_board, "black")
black_pawn2 = Pawn.new(current_board, "black")
black_pawn3 = Pawn.new(current_board, "black")
black_pawn4 = Pawn.new(current_board, "black")
black_pawn5 = Pawn.new(current_board, "black")
black_pawn6 = Pawn.new(current_board, "black")
black_pawn7 = Pawn.new(current_board, "black")
black_pawn8 = Pawn.new(current_board, "black")

black_pawn1.change_colour()
black_pawn2.change_colour()
black_pawn3.change_colour()
black_pawn4.change_colour()
black_pawn5.change_colour()
black_pawn6.change_colour()
black_pawn7.change_colour()
black_pawn8.change_colour()

black_pawn1.move()
black_pawn8.move(1,0)
black_pawn2.move(1,1)
black_pawn3.move(1,2)
black_pawn4.move(1,3)
black_pawn5.move(1,4)
black_pawn6.move(1,5)
black_pawn7.move(1,6)
black_pawn7.move(1,7)

black_rook1 = Rook.new(current_board,"black")
black_rook2 = Rook.new(current_board,"black")
black_rook1.change_colour()
black_rook2.change_colour()
black_rook1.move(0,0)
black_rook2.move(0,7)

black_knight1 = Knight.new(current_board,"black")
black_knight2 = Knight.new(current_board,"black")
black_knight1.change_colour()
black_knight2.change_colour()
black_knight1.move(0,1)
black_knight2.move(0,6)

black_queen = Queen.new(current_board,"black")
black_queen.change_colour()
black_queen.move(0,3)

black_king = King.new(current_board, "black")
black_king.change_colour()
black_king.move(0,4)






current_board.show_board()

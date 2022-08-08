# Pseudocode 

#make board 8x8
#show board 
# way to switch board/flip board
#reset board to array from joined
#Give each piece a class: eight pawns, two bishops, two knights, two rooks, one queen, and one king.
# Arrays for possible moves of pieces
#legal moves - within board limits 8x8 
# if a player lands on a square and another piece is there, take it.
# add to taken pieces, remove from board
#program in checkmate and check
#remaining pieces white 
#remaining pieces black 
#swap current player to other player 
#pawns: can jump over pieces, 1/2 if first_move = false  , pawns take diagonally 
#pawn to end = queen, rook, knight, or bishop
#castle/rook: move up or down , any number of moves 
#bishops: diagonal left or right :any number of moves
#knights: knight travails L
#queen: Up/down/diagonally any number of moves
#king: Up/down/diagonally one move 

class Board

    def initialize 
        make_board()
    end 

    def make_board
        @board = Array.new(8) { Array.new(8) { "a" } }
    end 

    def show_board
        @temp = @board
        @board = @board.map{|array| array.join("")}
        puts @board
        @board = @temp
    end 


    
end 

board = Board.new()
board.make_board
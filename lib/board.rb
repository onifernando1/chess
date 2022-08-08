require 'colorize'
# Pseudocode 

#make board 8x8 DONE 
#show board 
# way to switch board/flip board
#reset board to array from joined DONE 
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
        @white_square = "    ".colorize(background: :white)
        @black_square = "    ".colorize(background: :black)
        colour_board()
    end 

    def make_board
        @board = Array.new(8) { Array.new(8) { "a" } }
    end 

    def colour_board

        odd = [1,3,5,7]
        even = [0,2,4,6]
        
        @board.each_index do |index|
            if index == 0 || index == 2 || index == 4 || index == 6
                for i in odd 
                    @board[index][i] = @black_square
                end 
                
                for i in even 
                    @board[index][i] = @white_square
                end 
            end 

            if index == 1 || index == 3 || index == 5 || index == 7
                
                for i in odd 
                    @board[index][i] = @white_square
                end 

                for i in even 
                    @board[index][i] = @black_square
                end 
            end 
        end 

    end 

    def add_numbers_to_board
        
        @numbers = [1,2,3,4,5,6,7,8]
        @numbers.each do |number|
            @board[number-1].prepend(number.to_s + " ")
            @board[number-1] << ( + " " + number.to_s)
        end 

    end 

    def add_letters_to_board
        
        @letters = ["   A","   B","   C","   D","   E","   F","   G","   H"]
        @board.prepend(@letters)
        @board << @letters

    end 

    def join_board

        @board = @board.map do |array| 
            array.join("")
        end 


    end 

    def show_board
        
        @temp = @board
        
        add_numbers_to_board()
        add_letters_to_board()
        join_board()

        puts @board

        @board = @temp
    end 


    
end 

board = Board.new()
board.show_board()
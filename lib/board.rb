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

    attr_accessor :board

    def initialize 
        make_board()
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
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
            @temp[number-1].prepend(number.to_s + " ")
            @temp[number-1] << ( + " " + number.to_s)
        end 




    end 

    def add_letters_to_board
        
        @letters = ["   A "," B "," C "," D "," E "," F "," G "," H "]
        @temp.prepend(@letters)
        @temp << @letters

    end 

    def join_board

        @temp = @temp.map do |array| 
            array.join("")
        end 


    end 

    def remove_numbers_from_board

        @board = @board.each do |array|
            array.shift()
            array.pop()
        end 
    

    end 

    def show_board
        
        @temp = []
        @board.each {|array| @temp << array}

        add_numbers_to_board()
        add_letters_to_board()
        
        join_board()

        puts @temp
        
        remove_numbers_from_board() #don't know why numbers keep changing @board instead of @temp, cant reset board to temp at end for some reason 

    end 


    
end 

class Piece
end 



class Pawn 
    
    def initialize(current_board) 
        @string = " \u265F " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move_pawn(x=6, y=2)

        if @current_board[x][y] == @black_square
            @current_board[x][y] = @symbol.colorize(background: :light_magenta)
        elsif @current_board[x][y] == @white_square
            @current_board[x][y] = @symbol.colorize(background: :light_cyan)
        end 
    end 
end 

class Rook 
    def initialize(current_board) 
        @string = " \u265C " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 
end 

class Bishop 
    def initialize(current_board) 
        @string = " \u265D " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 
end 

class Queen 
    def initialize(current_board) 
        @string = " \u265B " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 
end 

class King 
    def initialize(current_board) 
        @string = " \u265A " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 
end 

class Game 
    def initialize(current_board) 
        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 

end 

# current_board = Board.new()
# current_board.show_board()
# knight = Knight.new(current_board)
# knight.move_knight()
# current_board.show_board()
# pawn = Pawn.new(current_board)
# pawn.move_pawn()
# current_board.show_board()

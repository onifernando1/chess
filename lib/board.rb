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
        @white_square = "   ".colorize(background: :white)
        @black_square = "   ".colorize(background: :black)
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

class Knight 

    def initialize(current_board) 
        @string = " \u265E " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
    end 

    def possible_moves(xx, yy)

        #possible moves of knight 

        x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
        y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]

        for i in (0..7)
            x = xx + x_coordinates[i]
            y = yy + y_coordinates[i]
            puts "#{x},#{y}"
        end 

    end

    def move_knight(x=2, y=3)
        @current_board[x][y] = @symbol
    end 
end 

class Pawn 
end 

class Rook 
end 

class Bishop 
end 

class Queen 
end 

class King 
end 

current_board = Board.new()
current_board.show_board()
knight = Knight.new(current_board)
knight.move_knight()
current_board.show_board()


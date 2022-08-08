
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

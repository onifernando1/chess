class Piece

    def initialize(current_board)
        @current_board = current_board.board

    end 

    def move(x=3, y=3)

        if @current_board[x][y] == @black_square
            @current_board[x][y] = @symbol.colorize(background: :light_magenta)
        elsif @current_board[x][y] == @white_square
            @current_board[x][y] = @symbol.colorize(background: :light_cyan)
        end 
    end 
end 
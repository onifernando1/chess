class Queen 
    def initialize(current_board) 
        @string = " \u265B " 
        @symbol =  @string.encode("utf-8").light_white
        @current_board = current_board.board
        @white_square = "   ".colorize(background: :light_cyan)
        @black_square = "   ".colorize(background: :light_magenta)
    end 
end 

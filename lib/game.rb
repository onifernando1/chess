require_relative 'bishop.rb'
require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'piece.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'rook.rb'
require_relative 'player.rb'
require_relative 'player_white.rb'
require_relative 'player_black.rb'

# build coordinate converter 
# move players on board
# check if another piece is there (of the same colour )
# take players

class Game 
    attr_accessor :co_ordinates # for testing 

    def initialize 
        @current_board = Board.new()
        set_up_white()        
        set_up_black()
        set_up_players()
        # knight = Knight.new(@current_board,"white")
        # knight.move(0,7)
        @current_board.show_board()
        @current_player = @player_white
        intro()
        @current_pieces = []
        save_current_pieces()
        @valid_start_coordinates = false 

    end 

    def intro
        puts "Welcome to Ruby Chess!"
        # puts "Please input your move using standard chess notation"
        # puts "King = K, Queen = Q, Bishop = B, Knight = N, Rook = R, Pawn = no notation."
        # puts "E.g At the start of the game to move a pawn from E2 to E4, you type: E4 "
        # puts "E.g: To move a king to E5 you type: KE5"
        
    end 

    def set_up_black

        @black_bishop1 = Bishop.new(@current_board,"black")
        @black_bishop2 = Bishop.new(@current_board,"black")
        @black_bishop1.change_colour()
        @black_bishop2.change_colour()
        @black_bishop1.move(0,2)
        @black_bishop2.move(0,5)

        @black_pawn1 = Pawn.new(@current_board, "black")
        @black_pawn2 = Pawn.new(@current_board, "black")
        @black_pawn3 = Pawn.new(@current_board, "black")
        @black_pawn4 = Pawn.new(@current_board, "black")
        @black_pawn5 = Pawn.new(@current_board, "black")
        @black_pawn6 = Pawn.new(@current_board, "black")
        @black_pawn7 = Pawn.new(@current_board, "black")
        @black_pawn8 = Pawn.new(@current_board, "black")

        @black_pawn1.change_colour()
        @black_pawn2.change_colour()
        @black_pawn3.change_colour()
        @black_pawn4.change_colour()
        @black_pawn5.change_colour()
        @black_pawn6.change_colour()
        @black_pawn7.change_colour()
        @black_pawn8.change_colour()

        @black_pawn1.move()
        @black_pawn8.move(1,0)
        @black_pawn2.move(1,1)
        @black_pawn3.move(1,2)
        @black_pawn4.move(1,3)
        @black_pawn5.move(1,4)
        @black_pawn6.move(1,5)
        @black_pawn7.move(1,6)
        @black_pawn7.move(1,7)

        @black_rook1 = Rook.new(@current_board,"black")
        @black_rook2 = Rook.new(@current_board,"black")
        @black_rook1.change_colour()
        @black_rook2.change_colour()
        @black_rook1.move(0,0)
        @black_rook2.move(0,7)

        @black_knight1 = Knight.new(@current_board,"black")
        @black_knight2 = Knight.new(@current_board,"black")
        @black_knight1.change_colour()
        @black_knight2.change_colour()
        @black_knight1.move(0,1)
        @black_knight2.move(0,6)

        @black_queen = Queen.new(@current_board,"black")
        @black_queen.change_colour()
        @black_queen.move(0,3)

        @black_king = King.new(@current_board, "black")
        @black_king.change_colour()
        @black_king.move(0,4)
    end 

    def set_up_white
        @white_pawn1 = Pawn.new(@current_board)
        @white_pawn2 = Pawn.new(@current_board)
        @white_pawn3 = Pawn.new(@current_board)
        @white_pawn4 = Pawn.new(@current_board)
        @white_pawn5 = Pawn.new(@current_board)
        @white_pawn6 = Pawn.new(@current_board)
        @white_pawn7 = Pawn.new(@current_board)
        @white_pawn8 = Pawn.new(@current_board)

        @white_pawn1.move()
        @white_pawn2.move(6,1)
        @white_pawn3.move(6,2)
        @white_pawn4.move(6,3)
        @white_pawn5.move(6,4)
        @white_pawn6.move(6,5)
        @white_pawn7.move(6,6)
        @white_pawn8.move(6,7)

        @white_rook1 = Rook.new(@current_board)
        @white_rook2 = Rook.new(@current_board)
        @white_rook1.move()
        @white_rook2.move(7,7)

        @white_knight1 = Knight.new(@current_board)
        @white_knight2 = Knight.new(@current_board)
        @white_knight1.move(7,1)
        @white_knight2.move(7,6)

        @white_bishop1 = Bishop.new(@current_board)
        @white_bishop2 = Bishop.new(@current_board)
        @white_bishop1.move()
        @white_bishop2.move(7,5)

        @white_queen = Queen.new(@current_board)
        @white_queen.move()

        @white_king = King.new(@current_board)
        @white_king.move()

    end 

    def save_current_pieces

        @current_pieces << @white_pawn1
        @current_pieces << @white_pawn2
        @current_pieces << @white_pawn3
        @current_pieces << @white_pawn4
        @current_pieces << @white_pawn5
        @current_pieces << @white_pawn6
        @current_pieces << @white_pawn7
        @current_pieces << @white_pawn8
        @current_pieces << @white_knight1
        @current_pieces << @white_knight2
        @current_pieces << @white_rook1
        @current_pieces << @white_rook2
        @current_pieces << @white_bishop1
        @current_pieces << @white_bishop2
        @current_pieces << @white_queen
        @current_pieces << @white_king

        @current_pieces << @black_pawn1
        @current_pieces << @black_pawn2
        @current_pieces << @black_pawn3
        @current_pieces << @black_pawn4
        @current_pieces << @black_pawn5
        @current_pieces << @black_pawn6
        @current_pieces << @black_pawn7
        @current_pieces << @black_pawn8
        @current_pieces << @black_knight1
        @current_pieces << @black_knight2
        @current_pieces << @black_bishop1
        @current_pieces << @black_bishop2
        @current_pieces << @black_rook1
        @current_pieces << @black_rook2
        @current_pieces << @black_queen
        @current_pieces << @black_king

        # puts @black_queen.current_position
    end 

    def set_up_players
        @player_white = PlayerWhite.new()
        @player_white.get_name()
        @player_black = PlayerBlack.new()
        @player_black.get_name()
    end 


    
    def get_start_coordinates
        puts "#{@current_player.name} Please type the co-ordinates of the piece you would like to move e.g A1"
        @player_start_coords = gets.chomp
        #valid_input? else gets again
        #get_coords_from_notation
        #check_legal
        # if @current_player == @player_white
        #     @current_player = @player_black
        # elsif @current_player == @player_black
        #     @current_player = @player_white
        # end 

    end 

    def co_ordinate_converter(input) # convert coordinates to match the piece on the board 

        # if they type B1 The 1 must be changed to a 7 (8-input) and this is the first value inputted into move 
        # the B refers to the 2(x- axis) this 2 must be converted to a 1 (-1) and is the second value inputted into move 
        @co_ordinates = []
        split_input = input.split("") # returns ["A",2]
      
        @co_ordinates << (8 -  split_input[1].to_i )  #moves correct coord to first place in new arr

        chess_notation = {"A" => 0, "B" => 1, "C" => 2 , "D" => 3, "E" => 4, "F" => 5, "G" => 6} # 2nd value in move()
        @co_ordinates << chess_notation.fetch(split_input[0]) # convert letter to number and move into second place

        p @co_ordinates

    end 

    def select_start_player(co_ordinates)
        
       @piece_selected = []
       @current_pieces.each do |piece|
        if piece.current_position == co_ordinates
            puts piece 
            puts piece.current_position
            puts "YAY"
            @piece_selected = piece
        end 
        
        end 

        puts "FINAL PIECE"
        puts @piece_selected
        puts @piece_selected.current_position


    end 

    # def valid_start_coordinates?
    #     # if white player, can select a white piece, if it can also move!
    #     # if black player, can select a black piece , if it can move!
    #     if @current_player == player_white
    #         if @piece_selected.colour != "white"
    #             puts "Can only pick your own pieces!"
    #         elsif 

        
        
        
        
    #     elsif @current_player == player_black
    #     end 

            

        

    # end 

    def get_end_coordinates
        puts "Please enter the co-ordinates of your move E.g: 'A1'"
        @player_end_coords = gets.chomp()


    end 

    def legal_move_generator(co_ordinates)

        # e.g start [7,2]
        @co_ordinates = co_ordinates
        @legal_end_x = []
        @legal_end_y = []
        length_of_potential_array = @piece_selected.potential_x.length - 1 
       
        for i in (0..length_of_potential_array) do 
            @legal_end_x  << @co_ordinates[0] + @piece_selected.potential_x[i]
            @legal_end_y << @co_ordinates[1] + @piece_selected.potential_y[i]
        end 

        p @legal_end_x
        p @legal_end_y

         
    end 

    def legal_move?

        

    end 

    def round 

        get_start_coordinates()
        co_ordinate_converter(@player_start_coords)
        select_start_player(@co_ordinates)
        legal_move_generator(@co_ordinates)
        # get_end_coordinates()
        # co_ordinate_converter(@player_end_coords)
        #____piece.move()

    end 
    

end 



game = Game.new()
game.round()
# game.save_current_pieces()


#TO Do 
#1. Add in potential moves of each piece 
#2. Check legal moves - if potential moves fit on board , check if that square is occupied by own piece(invalid) or other piece(take)
#3. get end coords, check legal 
#4. Move (=take )
#
#
#
#
#
#
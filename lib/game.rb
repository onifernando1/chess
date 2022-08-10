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

class Game 
    attr_accessor :co_ordinates 

    def initialize 
        @current_board = Board.new()
        set_up_white()        
        set_up_black()
        set_up_players()
        @current_board.show_board()
        @current_player = @player_white
        intro()
        @current_pieces = []
        save_current_pieces()
        update_current_pieces()
        @valid_start_coordinates = false 
        @start_valid = false 
    end 

    def intro
        puts "Welcome to Ruby Chess!"
        
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

    end 

    def update_current_pieces
         @white_pawn1.current_pieces = @current_pieces
         @white_pawn2.current_pieces = @current_pieces
         @white_pawn3.current_pieces = @current_pieces
         @white_pawn4.current_pieces = @current_pieces
         @white_pawn5.current_pieces = @current_pieces
         @white_pawn6.current_pieces = @current_pieces
         @white_pawn7.current_pieces = @current_pieces
         @white_pawn8.current_pieces = @current_pieces
         @white_knight1.current_pieces = @current_pieces
         @white_knight2.current_pieces = @current_pieces
         @white_rook1.current_pieces = @current_pieces
         @white_rook2.current_pieces = @current_pieces
         @white_bishop1.current_pieces = @current_pieces
         @white_bishop2.current_pieces = @current_pieces
         @white_queen.current_pieces = @current_pieces
         @white_king.current_pieces = @current_pieces
         @black_pawn1.current_pieces = @current_pieces
         @black_pawn2.current_pieces = @current_pieces
         @black_pawn3.current_pieces = @current_pieces
         @black_pawn4.current_pieces = @current_pieces
         @black_pawn5.current_pieces = @current_pieces
         @black_pawn6.current_pieces = @current_pieces
         @black_pawn7.current_pieces = @current_pieces
         @black_pawn8.current_pieces = @current_pieces
         @black_knight1.current_pieces = @current_pieces
         @black_knight2.current_pieces = @current_pieces
         @black_bishop1.current_pieces = @current_pieces
         @black_bishop2.current_pieces = @current_pieces
         @black_rook1.current_pieces = @current_pieces
         @black_rook2.current_pieces = @current_pieces
         @black_queen.current_pieces = @current_pieces
         @black_king.current_pieces = @current_pieces

    end 

    def set_up_players
        @player_white = PlayerWhite.new()
        @player_white.get_name()
        @player_black = PlayerBlack.new()
        @player_black.get_name()
    end 


    
    def get_start_coordinates
        puts "#{@current_player.name} 1.Please type the co-ordinates of the piece you would like to move e.g A1"
        @player_start_coords = gets.chomp
       
    end 

    def check_valid_start
        valid_letters = ["A","B","C","D","E","F","G","a","b","c","d","e","f","g"]    
        valid_numbers = [1,2,3,4,5,6,7,8]
        start_coords_to_check = @player_start_coords.split("")
        if valid_letters.include?(start_coords_to_check[0]) && valid_numbers.include?(start_coords_to_check[1].to_i) && start_coords_to_check.length == 2 
            @start_valid = true 
        else 
            puts "Oops! Try again with some valid co-ordinates!"
        end 

    end 

    def check_player_is_at_start # ensure only selects own player 

    end 

    def co_ordinate_converter(input) 

        # if they type B1 The 1 must be changed to a 7 (8-input) and this is the first value inputted into move 
        # the B refers to the 2(x- axis) this 2 must be converted to a 1 (-1) and is the second value inputted into move 
        @co_ordinates = []
        split_input = input.split("") 
        split_input[0] = split_input[0].upcase()
      
        @co_ordinates << (8 -  split_input[1].to_i )  #moves correct coord to first place in new arr

        chess_notation = {"A" => 0, "B" => 1, "C" => 2 , "D" => 3, "E" => 4, "F" => 5, "G" => 6, "H" =>7} 
        @co_ordinates << chess_notation.fetch(split_input[0]) 

        @co_ordinates

    end 

    def select_start_player(co_ordinates)
        # @valid_piece = nil
       @piece_selected = []
       @current_pieces.each do |piece|
        if piece.current_position == co_ordinates
            @piece_selected = piece
            # @valid_piece = true 
            # puts @piece_selected

        end 
        end 



    end 
 

    def get_end_coordinates

        puts "2.Please enter the co-ordinates of your move E.g: 'A1'"
        @player_end_coords = gets.chomp()

    end 

    def legal_move_generator(co_ordinates)

        @co_ordinates = co_ordinates
        @legal_end_x = []
        @legal_end_y = []
        
        if  @piece_selected == [] || @piece_selected.colour != @current_player.colour
            @valid_piece = false 
            puts "Silly goose. Pick a proper player"
        else 
            @valid_piece = true 
            length_of_potential_array = @piece_selected.potential_x.length - 1 
        
            for i in (0..length_of_potential_array) do 
                move_x = @co_ordinates[0] + @piece_selected.potential_x[i]
                move_y = @co_ordinates[1] + @piece_selected.potential_y[i]
                if move_x <=7 && move_y <=7 && move_x >=0 && move_y >=0
                    @legal_end_x  << move_x
                    @legal_end_y << move_y
                end 
            end 
        end 



         
    end 

    def legal_move(co_ordinates, legal_end_x, legal_end_y)

        @co_ordinates = co_ordinates

        @legal = false 

        legal_move_array_length = legal_end_x.length - 1 

        for i in (0..legal_move_array_length) do 
            
            if legal_end_x[i] == @co_ordinates[0] && legal_end_y[i] == @co_ordinates[1]

                @legal = true 

            end 


        end 
    end 

    def check_for_any_blocks
        if @piece_selected.string == " \u265B " || @piece_selected.string == " \u265D " || @piece_selected.string == " \u265C " #if queen/bishop/rook / add in pawn first move stuff later
            @piece_selected.plot_path(@start_co_ordinates[0],@start_co_ordinates[1],@end_co_ordinates[0],@end_co_ordinates[1])
        end 
        if @piece_selected.path_blocked == true 
            @legal = false 
            puts "Looks like someone is in your way!"
            @current_board.show_board()
        else 
            @legal = true 
         
            legal_move(@end_co_ordinates,@legal_end_x, @legal_end_y)
        end
    end 
  
    def start_of_round 

        until @valid_piece == true 
            until @start_valid == true 
                get_start_coordinates()
                check_valid_start()
            end 
            @start_valid = false #reset
            @start_co_ordinates = co_ordinate_converter(@player_start_coords)
            select_start_player(@start_co_ordinates)
            legal_move_generator(@start_co_ordinates)
        end 
        get_end_coordinates()
        @end_co_ordinates = co_ordinate_converter(@player_end_coords)
        check_for_any_blocks()
   

    end 

    def round 
        until @legal == true 
            start_of_round()
            
        end 

        if @legal == true 

            @piece_selected.check_destination(@end_co_ordinates,@current_player)
            if @piece_selected.path_blocked == false 
                @piece_selected.delete_old_move()
                @piece_selected.move(@co_ordinates[0],@co_ordinates[1])
            end 
            @current_board.show_board()

            # @legal = false #necessary?

        elsif @legal == false 
            puts "Sorry, you seem to have made an illegal move"
            puts "Let's start over"
        end         

    end 

 
    

end 



game = Game.new()
game.round()



#TO Do 

# Stop pieces moving through players (except knight)
    #Thoughts: 
    # need a way to plot path 
    # and see if another piece is in the way 
    # maybe i make move just a display move function 
    #say the start position is 7,2 and legal end coords is 5,2 (moving up 2 )
    # add basic move to each piece?
    #then i make that piece move to that spot in increments 
    # e.g until currentpos == 5,2 move up via the legal movement +1,0,
    # if its empty, it can move there, if another piece is there, it cant move there (or it can take!)
    # if piece == white move = not legal 
    # if piece = black it cant move if its not final dest
    # if final coo When moving change square at original starting coords to black/whiterd with black piece on take function 
    # remoe from current pieces
    # add piece to taken pieces array (in player_white/black obj"

    #add in only select own colours later 
    # change player 
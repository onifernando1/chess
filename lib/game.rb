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
    
        # set_up_white()        
        # set_up_black()
        set_up_players()
        @current_player = @player_white
        intro()
        @current_pieces = []
        add_black_to_promotion_array()
        add_white_to_promotion_array()
        # save_current_pieces()
        # update_current_pieces()

        ##################
        @white_pawn1 = Pawn.new(@current_board,"white")
        @white_king = King.new(@current_board, "white")
        # @white_bishop1 = Bishop.new(@current_board, "white")
        @black_bishop1 = Bishop.new(@current_board,"black")
        @black_rook1 = Rook.new(@current_board, "black")
        @black_rook2 = Rook.new(@current_board, "black")
        @black_bishop1.change_colour()
        @black_rook1.change_colour()
        @black_rook2.change_colour()
        @white_pawn1.move(6,2)
        @white_king .move(7,2)
        # @white_bishop1.move(7,4)
        @black_bishop1.move(4,5)
        @black_rook1.move(4,3)
        @black_rook2.move(3,1)
        @white_pawn1.current_position = [6,2]
        @white_king.current_position = [7,2]
        # @white_bishop1.current_position = [7,4]
        @black_bishop1.current_position = [4,5]
        @black_rook1.current_position = [4,3]#
        @black_rook2.current_position = [3,1]

        @current_pieces << @white_pawn1 
        @current_pieces << @white_king 
        # @current_pieces << @white_bishop1
        @current_pieces << @black_bishop1
        @current_pieces << @black_rook1
        @current_pieces << @black_rook2
        @white_pawn1.current_pieces = @current_pieces
        @white_king.current_pieces = @current_pieces
        # @white_bishop1.current_pieces = @current_pieces
        @black_bishop1.current_pieces = @current_pieces
        @black_rook1.current_pieces = @current_pieces
        @black_rook2.current_pieces = @current_pieces














        @generic_piece = Piece.new(@current_board, "white", @current_pieces)
        @valid_start_coordinates = false 
        @start_valid = false 
        @game_end = false 
        @king_in_check = true 
        @checkmate = false 
        @current_board.show_board()
        @previous_move_start = []
        @previous_move_end = []

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

        @black_pawn1.move(1,0)
        @black_pawn2.move(1,1)
        @black_pawn3.move(1,2) 
        @black_pawn4.move(1,3)
        @black_pawn5.move(1,4)
        @black_pawn6.move(1,5)
        @black_pawn7.move(1,6)
        @black_pawn8.move(1,7)


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
        @black_queen.move(0,3) # 0,3 

        @black_king = King.new(@current_board, "black")
        @black_king.change_colour()
        @black_king.move(0,4) # 

        @black_promoted_queen_1 = Queen.new(@current_board, "black")
        @black_promoted_queen_2 = Queen.new(@current_board, "black")
        @black_promoted_queen_3 = Queen.new(@current_board, "black")
        @black_promoted_queen_4 = Queen.new(@current_board, "black")
        @black_promoted_queen_5 = Queen.new(@current_board, "black")
        @black_promoted_queen_6 = Queen.new(@current_board, "black")
        @black_promoted_queen_7 = Queen.new(@current_board, "black")
        @black_promoted_queen_8 = Queen.new(@current_board, "black")
        @black_promoted_queen_1.change_colour()
        @black_promoted_queen_2.change_colour()
        @black_promoted_queen_3.change_colour()
        @black_promoted_queen_4.change_colour()
        @black_promoted_queen_5.change_colour()
        @black_promoted_queen_6.change_colour()
        @black_promoted_queen_7.change_colour()
        @black_promoted_queen_8.change_colour()
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
        @white_rook1.move() #empty
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

        @white_promoted_queen_1 = Queen.new(@current_board, "white")
        @white_promoted_queen_2 = Queen.new(@current_board, "white")
        @white_promoted_queen_3 = Queen.new(@current_board, "white")
        @white_promoted_queen_4 = Queen.new(@current_board, "white")
        @white_promoted_queen_5 = Queen.new(@current_board, "white")
        @white_promoted_queen_6 = Queen.new(@current_board, "white")
        @white_promoted_queen_7 = Queen.new(@current_board, "white")
        @white_promoted_queen_8 = Queen.new(@current_board, "white")

    end 

    def add_black_to_promotion_array

        @black_promotion_array = []

        @black_promotion_array << @black_promoted_queen_1
        @black_promotion_array << @black_promoted_queen_2
        @black_promotion_array << @black_promoted_queen_3
        @black_promotion_array << @black_promoted_queen_4
        @black_promotion_array << @black_promoted_queen_5
        @black_promotion_array << @black_promoted_queen_6
        @black_promotion_array << @black_promoted_queen_7
        @black_promotion_array << @black_promoted_queen_8

    end 

    def add_white_to_promotion_array
       @white_promotion_array = []
       @white_promotion_array << @white_promoted_queen_1
       @white_promotion_array << @white_promoted_queen_2
       @white_promotion_array << @white_promoted_queen_3
       @white_promotion_array << @white_promoted_queen_4
       @white_promotion_array << @white_promoted_queen_5
       @white_promotion_array << @white_promoted_queen_6
       @white_promotion_array << @white_promoted_queen_7
       @white_promotion_array << @white_promoted_queen_8
        
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

    def get_legal_check_co_ords(check_path_co_ords)
        check_path_co_ords.each do |array|
            if array[0] <=7 &&  array[0] >= 0 && array[1] <=7  && array[1] >=0
                @legal_check_path_co_ords << array
            end 
        end 
    end 

    def path_pieces_check(piece, co_ord)

       
        # @legal_check_path_co_ords.each do |co_ord|

            # only plot path if diff over x ? 
            check_piece_distance(piece, co_ord)
             
            if @need_to_check_path == true  
                
              
                
                piece.plot_path(piece.current_position[0],piece.current_position[1],co_ord[0],co_ord[1])
                
            else 
                piece.path_blocked = false 

              
            end 

        
          
            if piece.path_blocked == false && piece.checking_king == true 
                
                @king_in_check = true 
            end 

    end 

    def check_other_pieces_for_check(piece)

        if piece.checking_king == true 
            
            @king_in_check = true 

        end 
    end 


    

    def pre_game_check(current_pieces)

        @king_in_check = false 
        
        current_pieces.each do |piece|


            if piece.colour != @current_player.colour # e.g if white only chgeck black pieces
               

                piece.check_for_check(@current_player, @white_king, @black_king)
             

                if piece.checking_king == true 


                    if piece.string == " \u265D " || piece.string == " \u265C " || piece.string == " \u265B "

                        if @current_player.colour == "white"

                          
            
                         
                            path_pieces_check(piece, @white_king.current_position)

                          
                        else 

                            
                            path_pieces_check(piece, @black_king.current_position)
                            

                        end 
                    
                    else  
                        
                        check_other_pieces_for_check(piece)
                    end 
                end
             
            
            end 


        end 

    end 

    
    def find_path_of_piece_to_block

        if @pieces_that_are_checking.length == 1 
            @piece_checking_king = @pieces_that_are_checking[0]

            if @piece_checking_king.class == Queen ||@piece_checking_king.class == Bishop ||@piece_checking_king.class == Rook 

                @new_path = @piece_checking_king.set_up_path(@piece_checking_king.current_position[0],@piece_checking_king.current_position[1], @current_king.current_position[0],@current_king.current_position[1])
                @new_path 
                #check if any players (of opposite colour can move here)
            end 
        end  
    end 

    def check_if_checkmate_can_be_blocked

        #mark


        find_pieces_checking_king()


        find_path_of_piece_to_block()


        if @new_path != nil 


            puts "WE CHECKING FOR BLOCKS BRO"

            @pieces_that_could_block = []

            @current_pieces.each do |piece|
                if piece.colour == @current_player.colour && piece.class != King
                    @pieces_that_could_block << piece
                    p piece.colour 
                end 
            end 



            @new_path.each do |path_co_ord|

                @pieces_that_could_block.each do |piece| 


                legal_move_generator(piece.current_position, piece)


                
                legal_move(path_co_ord,@legal_end_x,@legal_end_y) # @legal_move = true 


                if @legal_move == true 

                    puts "LEGAL MOVE TRUE "
                
                        check_for_any_blocks(piece, piece.current_position, path_co_ord) # @block = false 

                        puts "BLOCK: #{@block}"

                        if @block == false 

                    
                            piece.check_destination(path_co_ord, @current_player)

                            if piece.path_blocked == false

                                puts "PATH BLOCKED FALSE "
                                # could be taken, check path if needed  

                                @checkmate_array << false 
                                
                            elsif piece.path_blocked == true 
                                puts "Can't be taken, checkmate:("
                                # @checkmate = true 
                                # @checkmate_array << true 
                            end 

                        end 
                    end 
                end 
            end 
        end 
       



    end 

    def check_mate_check
        @checkmate = false 
        #checkmate
        #if someone in check
        # check potential mvoes of king (legal)
        # if all of these would also be in check 
        #then checkmate
        # get current king 
        @current_pieces.each do |piece|
            if piece.colour == @current_player.colour && piece.class == King
                @current_king = piece 
            end 
        end 


        @checkmate_array = []


        check_if_checkmate_can_be_blocked()

        

        @current_king.sort_king_moves(@current_player)
        
        remember_king_current_position = @current_king.current_position

        p"________________________"
        p @current_king.sorted_moves

        @current_king.sorted_moves.each do |co_ords|
            @current_king.current_position = co_ords
            pre_game_check(@current_pieces)
            puts "KIC #{@king_in_check}"
            @checkmate_array << @king_in_check

        end 


        if @checkmate_array.all?(true)
            @checkmate = true 
            # puts "CHECKMATE"
        else 
            # puts "NOT CHECKMATE"
            p @checkmate_array

        end 

        @current_king.current_position = remember_king_current_position

    end 

  


    
    def get_start_coordinates
        puts "#{@current_player.name} 1.Please type the co-ordinates of the piece you would like to move e.g A1"
        @player_start_coords = gets.chomp
       
    end 

    def check_valid_start_input(co_ordinates)
        @start_valid = false
        valid_letters = ["A","B","C","D","E","F","G", "H", "a","b","c","d","e","f","g","h"]    
        valid_numbers = [1,2,3,4,5,6,7,8]
        start_coords_to_check = co_ordinates.split("")
        if valid_letters.include?(start_coords_to_check[0]) && valid_numbers.include?(start_coords_to_check[1].to_i) && start_coords_to_check.length == 2
            @start_valid = true 
        else 
            puts "Oops! Try again with some valid co-ordinates!"
        end 


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
        @valid_piece = false
       @piece_selected = []
       @current_pieces.each do |piece|
            if piece.current_position == co_ordinates
                @piece_selected = piece
                @valid_piece = true
            end 
        end 



    end 

    def select_end_player(co_ordinates)
       @end_piece = []
       @current_pieces.each do |piece|
        if piece.current_position == co_ordinates
            @end_piece = piece

        end 
        end 

        @end_piece

    end 

    def find_pieces_checking_king


        @pieces_that_are_checking = []

            @current_pieces.each do |piece|
                if piece.checking_king == true 
                    @pieces_that_are_checking << piece
                end 
            end  
        @pieces_that_are_checking
    end
    
    def remove_player(current_pieces_duplicate)

        @king_definitely_in_checkmate = false 
        @king_definitely_in_checkmate_array = []


        @pieces_that_are_checking.each do |piece|

            current_pieces_duplicate.delete(piece)

            pre_game_check(current_pieces_duplicate)

            @king_definitely_in_checkmate_array << @king_in_check

            if @king_definitely_in_checkmate_array.any?(false)
                @king_definitely_in_checkmate = false 
            else 
                @king_definitely_in_checkmate = true 
            end 

            # pointer


        end 


    end 

    def check_if_piece_checking_king_can_be_taken

        # ma

        if @checkmate == true 

            find_pieces_checking_king()
            current_pieces_duplicate = @current_pieces
            # go through array, see if removing that person still keeps them in check 
            #remove the first piece from current pieces dupl
            remove_player(current_pieces_duplicate)

        end 
       

    end 

    def get_end_coordinates

        puts "#{@current_player.name} 2.Please enter the co-ordinates of your move E.g: 'A1'(type back to go back)"
        @player_end_coords = gets.chomp()

    end 

    def legal_move_generator(co_ordinates, piece_selected)


        @co_ordinates = co_ordinates
        @legal_end_x = []
        @legal_end_y = []

        
        if  piece_selected == [] || piece_selected.colour != @current_player.colour
            puts "Silly goose. Pick a proper player"
        else 
            piece_selected.potential_moves()

            length_of_potential_array = piece_selected.potential_x.length - 1 
            for i in (0..length_of_potential_array) do 
                move_x = @co_ordinates[0] + piece_selected.potential_x[i]
                move_y = @co_ordinates[1] + piece_selected.potential_y[i]
                if move_x <=7 && move_y <=7 && move_x >=0 && move_y >=0
                    @legal_end_x  << move_x
                    @legal_end_y << move_y
                    
                end 
            end 
        end 



         
    end 

    def legal_move(co_ordinates, legal_end_x, legal_end_y) # returns @legal_move
        @co_ordinates = co_ordinates
        @legal_move = false 

        legal_move_array_length = legal_end_x.length - 1 

        for i in (0..legal_move_array_length) do 
            
            if legal_end_x[i] == co_ordinates[0] && legal_end_y[i] == co_ordinates[1] # @ commented out 
                @legal_move = true 
            end 
        end 
    end 

    def check_for_any_blocks(piece_selected, start_co_ordinates, end_co_ordinates) # returns @block
            #mark3 
        @block = true 
        if piece_selected.string == " \u265B " || piece_selected.string == " \u265D " || piece_selected.string == " \u265C " 
            
            check_piece_distance(piece_selected, end_co_ordinates)

            if @need_to_check_path == true  
                piece_selected.plot_path(start_co_ordinates[0],start_co_ordinates[1],end_co_ordinates[0],end_co_ordinates[1])
            else 
                piece_selected.path_blocked = false 
            end 

        end 

        if piece_selected.class == Pawn && piece_selected.first_move == true 
            check_pawn_distance(@piece_selected)
            if @need_to_check_path == true 
                piece_selected.plot_path()
            else 
                piece_selected.path_blocked = false # unecessary?
            end 
        end

        if piece_selected.path_blocked == true 
            @block = true  
            puts "Someone is in your way :("
            puts "Try again"
        else 
            # legal_move(@end_co_ordinates,@legal_end_x, @legal_end_y)
            @block = false 

        end
    end 

    def check_pawn_distance(current_piece) # returns need_to_check_path

        @need_to_check_path = false 

        end_x = @end_co_ordinates[0]

        current_x = current_piece.current_position[0]

        if end_x - current_x <= -2 ||  end_x - current_x >= 2 
            @need_to_check_path = true 
        end 

    end 


    def check_piece_distance(current_piece,end_co_ordinates) # returns need to check path
        @need_to_check_path = false 

        end_x = end_co_ordinates[0]
        end_y = end_co_ordinates[1]

        current_x = current_piece.current_position[0]
        current_y = current_piece.current_position[1]
        if end_x - current_x <= -2 ||  end_x - current_x >= 2|| end_x - current_x <= -2||  end_x - current_x >= 2 || end_y - current_y <= -2 ||  end_y - current_y >= 2|| end_y - current_y <= -2||  end_y - current_y >= 2 
            @need_to_check_path = true 
        end 
    end 

    def check_colour # returns correct colour 

        @correct_colour = false 
        if @current_player.colour == @piece_selected.colour 
            @correct_colour= true 
        else 
            puts "Must pick own colour! cheeky!"
        end 

    end 


    def reset 
        @valid_piece = false 
        @start_valid = false 
        @block = true 
        @legal_move = false 
        @correct_colour = false 
        @continue = false 
    end 


    def swap_player 
        if @current_player == @player_black
            @current_player = @player_white
            puts "SWAP"
            round()
        elsif @current_player == @player_white
            @current_player = @player_black
            puts "SWAP"
            round()

        end 

    end 

    def get_valid_input


            get_start_coordinates()

            check_valid_start_input(@player_start_coords)      

    end

    def report_start_errors

        if @piece_selected.class == Array 
            puts "Hmm not quite..."
            reset()
        else

            if @valid_piece == false 
                puts "Please pick a valid piece!"
               

                reset()

            end 

            check_colour()

            if @correct_colour == false 
                puts "Select the correct colour!"
                reset()

            end 
        end
    end 

    
    def start_of_round 


        @checkmate = false # move to methods later
        @king_in_check = false # move to methods later

        pre_game_check(@current_pieces)

        puts "CHECK?#{@king_in_check}"

        

        if @king_in_check == true 
            puts "WARNING! CHECK!"
            check_mate_check()
        end 



        if @checkmate == true 
            puts "ALMOST CHECKMATE! "
            #player_x_wins  = true            
        end 


        check_if_piece_checking_king_can_be_taken()

        if @king_definitely_in_checkmate == true 
            puts "CHECKMATE!"

        end 

        @continue = false 

        @valid_piece = false 
        @correct_colour = false 


        until @valid_piece == true  && @correct_colour == true && @piece_selected.class != Array
            @start_valid = false 
            until @start_valid == true 
                get_valid_input()
            end 

            @start_co_ordinates = co_ordinate_converter(@player_start_coords)
            
            select_start_player(@start_co_ordinates)

            report_start_errors()
            


        end 
        @continue = true 

        if @previous_move_start != []
            check_if_en_passant_possible(@piece_selected) # delete later 
            puts "ENPA IN ROUND "
        end 


    end 

    def error_messages

        if @block == true 
            puts "Seems like your blocked..."
        end 

        if @legal_move == false 
            puts "Seems like this move isn't legal..."
        end 
    end 
## pawn stuff 
    def find_pawn_players(co_ordinates)

        @pawn_attack_piece = []
        @current_pieces.each do |piece|
         if piece.current_position == co_ordinates
             @pawn_attack_piece = piece
    
         end 
         end 
    
         @pawn_attack_piece
    end 
    
    
    def check_if_pawn_can_take(co_ordinates)
    
    
        if @piece_selected.class == Pawn #&& @piece_selected.colour == "white"
            current_position = @piece_selected.current_position 
            current_position_x = current_position[0]
            current_position_y = current_position[1]

            if @piece_selected.colour == "white"
                up_right_x = current_position_x - 1 
                up_right_y = current_position_y + 1 
                up_right_co_ords = []
                up_right_co_ords << up_right_x
                up_right_co_ords << up_right_y

                up_left_x = current_position_x - 1 
                up_left_y = current_position_y - 1    
                up_left_co_ords = []
                up_left_co_ords << up_left_x
                up_left_co_ords << up_left_y  

            elsif @piece_selected.colour == "black"


                up_right_x = current_position_x + 1 
                up_right_y = current_position_y - 1 
                up_right_co_ords = []
                up_right_co_ords << up_right_x
                up_right_co_ords << up_right_y

                up_left_x = current_position_x + 1 
                up_left_y = current_position_y + 1    
                up_left_co_ords = []
                up_left_co_ords << up_left_x
                up_left_co_ords << up_left_y  


            end 

            if up_right_co_ords == co_ordinates 

    
    
                if @current_board.board[up_right_x][up_right_y] != @piece_selected.black_square && @current_board.board[up_right_x][up_right_y] != @piece_selected.white_square
                    @pawn_attack_piece_up = find_pawn_players(up_right_co_ords)
                    if @pawn_attack_piece.colour == @current_player.colour 
                        #blocked 
                    else 
                        #take()
                        @block = false 
                    end 
                elsif @current_board.board[up_right_x][up_right_y] == @piece_selected.black_square || @current_board.board[up_right_x][up_right_y] == @piece_selected.white_square
                    @block = true 
                    en_passant()
                end 
                    
            
            elsif up_left_co_ords == co_ordinates


                if @current_board.board[up_left_x][up_left_y] != @piece_selected.black_square && @current_board.board[up_left_x][up_left_y] != @piece_selected.white_square
                    @pawn_attack_piece_up = find_pawn_players(up_left_co_ords)
                    if @pawn_attack_piece.colour == @current_player.colour 
                        #blocked 
                        puts "#blocked"
                    else 
                        #take()
                        puts "#take"
                        @block = false 

                    end 
                elsif @current_board.board[up_left_x][up_left_y] == @piece_selected.black_square || @current_board.board[up_left_x][up_left_y] == @piece_selected.white_square
                    @block = true 
                    en_passant()

                end 
            end 








        end 
        
    end 

    def check_if_pawn_at_end
        
        @pawn_at_end = false 

        @current_pieces.each do |piece|

            if piece.class == Pawn && piece.end_positions.include?(piece.current_position) 
                @pawn_at_end = true 
                @pawn_to_be_promoted = piece
            end 
        end 

    end 

    def change_to_black_or_white_square(co_ords)

        x = co_ords[0]
        y = co_ords[1]

        white_square_coords = [[0,0],[0,2],[0,4],[0,6]]
        black_square_coords = [[0,1],[0,3],[0,5],[0,7]]

        if white_square_coords.include?(co_ords)
            @current_board.board[x][y] = @white_king.white_square
        elsif black_square_coords.include?(co_ords)
            @current_board.board[x][y] = @white_king.black_square
        end 



    end 

    def en_pass_colour_change(co_ords)

        p "COORDS#{co_ords}"

        x = co_ords[0]
        y = co_ords[1]

        white_square_coords = [[3,1],[3,3],[3,5],[3,7],[4,0],[4,2],[4,4],[4,6]]
        black_square_coords = [[3,0],[3,2],[3,4],[3,6],[4,1],[4,3],[4,5],[4,7]]

        if white_square_coords.include?(co_ords)
            @current_board.board[x][y] = @white_king.white_square
        elsif black_square_coords.include?(co_ords)
            @current_board.board[x][y] = @white_king.black_square
        end 



    end 


    def pawn_promotion 


        check_if_pawn_at_end()

        if @pawn_at_end == true 

            @location_of_promotion = @pawn_to_be_promoted.current_position
            @location_of_promotion_x = @pawn_to_be_promoted.current_position[0]
            @location_of_promotion_y = @pawn_to_be_promoted.current_position[1]


            if @current_player.colour == "white"
                @current_pieces.delete(@current_board.board[@location_of_promotion_x][@location_of_promotion_y])
                promoted_pawn =  @white_promotion_array[0]
                @white_promotion_array.delete_at(0)
                @current_pieces << promoted_pawn
                change_to_black_or_white_square(@location_of_promotion)
                promoted_pawn.move(@location_of_promotion_x,@location_of_promotion_y)

                @current_board.show_board()
                

            else 
                @current_pieces.delete(@current_board.board[@location_of_promotion_x][@location_of_promotion_y])
                promoted_pawn = @black_promotion_array[0]
                @black_promotion_array.delete_at(0)
                @current_pieces << promoted_pawn
                change_to_black_or_white_square(@location_of_promotion)
                promoted_pawn.move(@location_of_promotion_x,@location_of_promotion_y)
                @current_board.show_board()

            end 
        end 




    end 

    def check_if_en_passant_possible(piece_selected)

        @en_passant_possible = false 

        puts "PMSPME#{@previous_move_start},#{@previous_move_end}"

        @potential_pawn = @generic_piece.find_player([@previous_move_end[0],@previous_move_end[1]])
        
        start_x_pawn =  @previous_move_start[0]
        end_x_pawn = @previous_move_end[0]

        pawn_moved_two_spots = false 
        x_pawn_difference = start_x_pawn - end_x_pawn


        if x_pawn_difference == 2
            pawn_moved_two_spots = true 
        elsif x_pawn_difference == -2 
            pawn_moved_two_spots = true 
        end 


        current_piece_x = piece_selected.current_position[0]
        location_relative_to_current_piece = current_piece_x - end_x_pawn
      


        if @potential_pawn.class == Pawn && @potential_pawn.colour != @current_player.colour && pawn_moved_two_spots == true && location_relative_to_current_piece == 0 && piece_selected.class == Pawn
            @en_passant_possible = true 
        end 

    end 

    def en_passant_take 
        @potential_pawn.delete_destination([@previous_move_end[0],@previous_move_end[1]]) 
        en_pass_colour_change(@potential_pawn.current_position)
        @current_pieces.delete(@potential_pawn)

        puts "TAKE"

    end 

    def en_passant()

        if @en_passant_possible == true 
            
            @block = false 

            en_passant_take()
        end 
       

    end 


## end of pawn stuff 


    def get_valid_end_input

            get_end_coordinates()
            

            if @player_end_coords == "back" ||@player_end_coords == "BACK"
                puts "IN IF "
                @continue = false 
                restart_round()
            else 

                check_valid_start_input(@player_end_coords)
            end 

            if @start_valid != true 
                get_valid_end_input()
            end

    end 

    def restart_round()
        puts"RSTART"
        round()
    end

    def get_valid_end_co_ords

        #mark2


        until @block == false && @legal_move == true && @piece_selected.path_blocked == false


            get_valid_end_input()


            @end_co_ordinates = co_ordinate_converter(@player_end_coords)
            
            legal_move(@end_co_ordinates,@legal_end_x, @legal_end_y)

            check_for_any_blocks(@piece_selected, @start_co_ordinates, @end_co_ordinates) # legal move() in this "

### pawn stuff 
            check_if_pawn_can_take(@end_co_ordinates)

### end of pawn stuff 
            @piece_selected.check_destination(@end_co_ordinates, @current_player)

            error_messages()

        end 
    end 

    def take_piece

        if @piece_selected.take == true 
            @end_piece = select_end_player(@end_co_ordinates)
            # @current_pieces.delete(@end_piece)
            @end_piece.delete_destination(@end_co_ordinates) 
            @current_pieces.delete(@end_piece)
              
            @piece_selected.take = false #reset take
        end 
    end 


    def end_of_round


        @piece_selected.potential_moves() # ensure pawn moves updated in case second move 

        legal_move_generator(@start_co_ordinates, @piece_selected) #legal_move_gen_valid 

        get_valid_end_co_ords()

    
        @piece_selected.delete_old_move()

        take_piece()

        @piece_selected.move(@end_co_ordinates[0],@end_co_ordinates[1])

        if @piece_selected.class == Pawn 
            @piece_selected.potential_moves()
            @piece_selected.first_move = false 
        end 



        @current_board.show_board()

        @previous_move_start = @start_co_ordinates
        @previous_move_end = @end_co_ordinates


        pawn_promotion()

       
    end

    def round 
        start_of_round()

        if @continue == true 
            end_of_round()
            reset()
            swap_player()
        end 

    end 

    def game 
        round()
        round()
        round()
        round()
        round()
        round()
        round()
    end 

 
    

end 



game = Game.new()
game.game()

# check pawn stuff - should be fine 

#add in en passsant s


# add in checks 

# add in save 

#check:
# the king can be taken by a piece in the next move, if the king doesn't escape 

#checkmate
# the king will be taken next move, regardless of where it moves

# Stalemate
# When a player cannot make any legal move, but he is not in check, 
#then the player is said to be stalemated. 
#In a case of a stalemate, the game is a draw.

# pawn can turn to queen at end 

#back - a7 (empty square) crashes - goes on to next step when it shouldnt 

# update current pieces on each player!
# reset all current pieces in check to false

#reset path blocked to false 
# change in check to checking_king

# check seems to be working 
# if check == true, then only allow piece selected at start to be king 
# only let it move into a position that is not in check 
# until king not in check, make them move out of the way


#checkmate
#if someone in check
# check potential mvoes of king (legal)
# if all of these would also be in check 
#then checkmate

# if check, ensure next move removes check ?
# change checkmate to prelim checkmate
# check preliminary checkmate,
# if prelim checkmate true 
# if piece.taking king == true 
#array of pieces taking the king 
# check if that piece can be taken 
# remove that piece from current pos and check for checkmate again (only remove one piece at a time)
#then confirm checkmate if that piece cannot be taken to stop prelim checkmate

#add in en passant

# add in save


# checkmate should be done - check with black as well !!!!
# check promotion array being altered
##


#big to do 
#add in en passant
# add in save
# check if path can be blocked in checkmate

#en passant pseudo:

# find piece(A) to left/right of pawn (B)
# if it is a pawn(A)
# and if it(A) just moved two spaces (i.e first move = false && previous move was moving that pawn by two ???)
# pawn(B) can move diagonally in front of +-x that pawn (A)
# pawn (A) is taken 
# 
# remember previous move? # at end of turn prev move = current pos of piece moved
# find_piece(prev move ) if == pawn && first_move = false 
# can do en passant 
#
#
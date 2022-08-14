require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'
require_relative 'bst.rb'
require_relative 'tree.rb'
require_relative 'node.rb'


class Rook < Piece

    attr_accessor :string, :symbol, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked

    def initialize(current_board, colour="white")
        super
        @string = " \u265C " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=0)
        super
    end 


    def potential_moves
        
        @potential_x = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0]
        @potential_y = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7]
    
    end 



    def set_up_path(starting_x,starting_y, ending_x,ending_y)
        tree = RookTree.new()
        p "TREE MADE "
        tree.mini_steps(starting_x,starting_y, ending_x,ending_y)
        @path = tree.print_path()
    end 

    def check_if_piece_blocking_path # move to piece

        @path_blocked_array = []

        if @path.length >= 2 # change to equal two 
            @path.each do |move|
            
                move_x = move[0]
                move_y = move[1]


                if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square
                
                        @destination_player = find_player(move)
                end 

                
        
                
                if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square

                    @path_blocked_array << false 
                else
                    @path_blocked_array << true 
                end  
            end 



            if @path_blocked_array.include?(true)
                @path_blocked = true 
            end 

        elsif @path.length == 1 #change to 1  

        

            move_x = @path[0][0]
            move_y = @path[0][1]
            

            if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square
            
                    @destination_player = find_player(move)
            end 

            
    
            
            if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square

                @path_blocked_array << false 
            else
                @path_blocked_array << true 
            end   



            if @path_blocked_array.include?(true)
                @path_blocked = true 
            end 

        end 


    end 

    def plot_path(starting_x,starting_y,ending_x,ending_y)
        
        set_up_path(starting_x,starting_y, ending_x,ending_y)
        check_if_piece_blocking_path()
    end 
end 


class Node attr_accessor :x, :y, :distance, :co_ordinates, :parent

    def initialize(x=nil, y=nil, distance=0, parent=nil)
        @x = x
        @y = y  
        @co_ordinates = [x,y]
        @parent = parent
        @distance = distance
    end 


end 

class RookTree < Tree
     attr_accessor :queue, :moves, :path, :continue, :distance, :current_node, :node


    def mini_steps(x_start, y_start, x_end, y_end)

   
        #possible moves of bishop base  # if it starts using diagonals to cut, if x increase then do these moves: etc. 

      
        @x_coordinates = [+1,-1,0,0]
        @y_coordinates = [0,0,-1,+1]




        #matrix to track visited spaces

        matrix = [
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false],
                    [false,false,false,false,false,false,false,false]
        ]

        visited = matrix


        # root = add_node(x_start, y_start, 0)
         #pointer
         @current_node = add_node(x_start, y_start, 0) 
         node_number = 0
  
        #set start root node to visited 
        visited[x_start][y_start] = true 

        
        until @current_node.x == x_end  && @current_node.y == y_end  #||@current_node.y > 7 && @current_node.y < 0 && @current_node.x < 0 && @current_node.x > 7 
            
           
            
            #go through possible moves 

            length_of_potential_moves = @x_coordinates.length - 1 

            for i in (0..length_of_potential_moves)

                x = @current_node.x + @x_coordinates[i]
                y = @current_node.y + @y_coordinates[i]

                if move_valid?(x,y) && visited[x][y] == false 
                    visited[x][y] = true 
                    @moves << add_node(x,y,@current_node.distance + 1, @current_node )
                end
                
            end 

            #move to next node in @nodes
                node_number += 1 
                @current_node = @queue[node_number]
                # visited = matrix

           

        end 
        visited = matrix


    
    end 
end 




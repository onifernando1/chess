require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'bst.rb'
require 'colorize'


class Queen < Piece

    attr_accessor :symbol, :colour, :string, :current_position, :potential_x, :potential_y, :current_pieces, :path_blocked, :string 

    def initialize(current_board, colour="white")
        super 

        @string = " \u265B " 
        @symbol =  @string.encode("utf-8").light_white
        @current_position = [0,0]
        potential_moves()
        @path_blocked = true 

        # @current_board = current_board.board
        # @white_square = "   ".colorize(background: :light_cyan)
        # @black_square = "   ".colorize(background: :light_magenta)
    end 

    def move(x=7, y=3)

        super
    end 

    def change_colour()
        super 
    end 

    def potential_moves

        @potential_x = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0,-1,-1,+1,+1,-2,-2,+2,+2,-3,-3,+3,+3,-4,-4,+4,+4,-5,-5,+5,+5,-6,-6,+6,+6,-7,-7,+7,+7]
        @potential_y = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7,+1,-1,+1,-1,+2,-2,+2,-2,+3,-3,+3,-3,+4,-4,+4,-4,+5,-5,+5,-5,+6,-6,+6,-6,+7,-7,+7,-7]

    end 

    def delete_old_move
        super()
    end 

    def find_player(end_co_ordinates) 
        super 
    end 

    def find_path(start_co_ordinates, end_co_ordinates, current_player)
        #e.g youre given start coordinates E1
        # end coordinates E2 
        # piece in your way ;. cant move 
        # start coords unecessaary but for ease of using method all the time keep all methods the same 
        start_x = start_co_ordinates[0]
        start_y = start_co_ordinates[1]
        end_x = end_co_ordinates[0]
        end_y = end_co_ordinates[1]  

        if @current_board[end_x][end_y] != @black_square || @current_board[end_x][end_y] != @white_square

            @destination_player = find_player(end_co_ordinates)  
          
        end 

         
        if @current_board[end_x][end_y] == @black_square || @current_board[end_x][end_y] == @white_square
            @path_blocked = false 
        elsif @destination_player.colour == current_player.colour  # find piece 
            @path_blocked = true 
        else # take 
            puts "TIME TO TAKE PIECE"
            @path_blocked = false 
        end  
        
    end 

    def plot_path(starting_x,starting_y,ending_x,ending_y)

           #get start and move base moves until destination reached, that will dform path, check all coordinates on path for pieces 

           tree = Tree.new()
           tree.min_steps(starting_x,starting_y, ending_x,ending_y)
           @path = tree.print_path()

           # check each of coordinates on path for person 

           @path_blocked_array = []

           @path.each do |move|

                move_x = move[0]
                move_y = move[1]

                if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square

                    @destination_player = find_player(move)  
                
                end 
        
                
                if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square
                    @path_blocked_array << false 
                else #@destination_player.colour == current_player.colour  # find piece 
                    @path_blocked_array << true 
                    puts "PATH BLOCKED NONONO"
                end  
            end 

            if @path_blocked_array.include?(true)
                @path_blocked = true 
            end 


           


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

class Tree attr_accessor :queue, :moves, :path, :continue, :distance, :current_node, :node

    def initialize 
        @queue = []
        @moves = []
        @path = []
        @continue = true 
    end 

    def add_node(x, y, distance, parent=nil)
        node = Node.new(x, y, distance, parent)
        @queue << node 
        node
    end 

    def move_valid? (x, y)

        if x < 8 && x > 0 && y < 8 && y > 0 
            return true 
        else 
            return false 
        end 

    end 

    def min_steps(x_start, y_start, x_end, y_end)

        #check if in board



        # unless move_valid?(x_start, y_start) && move_valid?(x_end, y_end)
        #     puts "OUTSIDE OF BOARD"
        #     @continue = false 
        #     return 
        # end 

   
        #possible moves of queen base  # if it starts using diagonals to cut, if x increase then do these moves: etc. 

        x_coordinates = [+1,-1,0,0,-1,-1,+1,+1]
        y_coordinates = [0,0,-1,+1,+1,-1,+1,-1]




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

        puts "CNCNCNNCNCNC#{@current_node}CNCNCNCNCNC"
        puts "CNX#{@current_node.x}CNX"

        
        until @current_node.x == x_end ||@current_node.x > 7 || @current_node.x < 0  && @current_node.y == y_end  ||@current_node.y > 7 || @current_node.y < 0 
            puts "Until#{@current_node}CNCNCNCNCNC"
            puts "Until CNX#{@current_node.x}CNX"


            #go through possible moves 

            for i in (0..3)

                x = @current_node.x + x_coordinates[i]
                y = @current_node.y + y_coordinates[i]

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
    
    def print_path


        current = @current_node

        puts "You made it in #{@current_node.distance} moves"

        for i in (0..@current_node.distance)
            @path.prepend(current.co_ordinates)
            current = current.parent
        end 


        # remove first (starting) move
        @path.shift()
        # remove end move (dealt with in findpathfunction)
        @path.pop()
        p @path


        @path

    end 
end 


# starting_x = 7
# starting_y = 4
# ending_x = 7
# ending_y = 1

# # class Board 

# #     def initialize 
# #         @current_board = []
# #     end 

# # end 

# # board = Board.new()
# # queen = Queen.new(board)
# # queen.plot_path(starting_x,starting_y,ending_x,ending_y)

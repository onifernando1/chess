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
        @path_blocked = nil 

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
        super(end_co_ordinates) 
    end 


    def check_destination(end_co_ordinates, current_player) 
        super(end_co_ordinates, current_player  )
    end 


def set_up_path(starting_x,starting_y, ending_x,ending_y)
    puts "SUP"
    tree = Tree.new()
    p "TREE MADE "
    tree.minim_steps(starting_x,starting_y, ending_x,ending_y)
    @path = tree.print_path()
    puts "SUP DONE "
end 

def check_if_piece_blocking_path()

    puts "CIBP"

    @path_blocked_array = []

    if @path.length > 2 
        @path.each do |move|
        
            move_x = move[0]
            move_y = move[1]


            if @current_board[move_x][move_y] != @black_square || @current_board[move_x][move_y] != @white_square
            
                    @destination_player = find_player(move)
                    puts "DEAST PLAYER MADE "
            end 

            puts "CHECK IF PIECE BLOCKING PATH FUNC"
    
            
            if @current_board[move_x][move_y] == @black_square || @current_board[move_x][move_y] == @white_square #|| @destination_player.colour != current_player.colour 

                @path_blocked_array << false 
                "PUTS FALSE "
            else
                @path_blocked_array << true 
                puts "TRUE "
            end  
        end 



        if @path_blocked_array.include?(true)
            @path_blocked = true 
        end 

    else# @path.length == 2 

    

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
    # what to do for one move?


end 

def plot_path(starting_x,starting_y,ending_x,ending_y)
    puts "PLOT PATH CALLED "
    set_up_path(starting_x,starting_y, ending_x,ending_y)
    p @path
    puts "ABOVE ME PATH"
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

    if x < 8 && x >= 0 && y < 8 && y >= 0 
        return true 
    else 
        return false 
    end 

end 

def minim_steps(x_start, y_start, x_end, y_end)


    #possible moves of queen base  # if it starts using diagonals to cut, if x increase then do these moves: etc. 

    # if diagonal 

    # if up or down or left or right 
    
    puts "IN MINI STEPS "
    x_change = x_end - x_start
    y_change = y_end - y_start   

    diagonal_x_movements = [-1,-1,+1,+1,-2,-2,+2,+2,-3,-3,+3,+3,-4,-4,+4,+4,-5,-5,+5,+5,-6,-6,+6,+6,-7,-7,+7,+7]
    diagonal_y_movements = [+1,-1,+1,-1,+2,-2,+2,-2,+3,-3,+3,-3,+4,-4,+4,-4,+5,-5,+5,-5,+6,-6,+6,-6,+7,-7,+7,-7]
    cross_x_movements = [+1,-1,0,0,+2,-2,0,0,+3,-3,0,0,+4,-4,0,0,+5,-5,0,0,+6,-6,0,0,+7,-7,0,0]
    cross_y_movements = [0,0,-1,+1,0,0,-2,+2,0,0,-3,+3,0,0,-4,+4,0,0,-5,+5,0,0,-6,+6,0,0,-7,+7]
    

    for i in (0..diagonal_x_movements.length - 1 )
        puts "In diag for loop"
        if diagonal_x_movements[i] == x_change && diagonal_y_movements[i] == y_change
            @diagonal = true 
            puts "In diag if "        
        end  
    end 

    for i in (0..cross_x_movements.length - 1 )
        if cross_x_movements[i] == x_change && cross_y_movements[i] == y_change
            @cross = true 
        else
            @cross = false
        end  
    end 

    if @cross == true 
        x_coordinates = [+1,-1,0,0]
        y_coordinates = [0,0,-1,+1]
    end 
    
    if  @diagonal == true  
        "Puts in diag true elsif "
        x_coordinates = [-1,-1,+1,+1]
        y_coordinates = [+1,-1,+1,-1]
    end 




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

        length_of_potential_moves = x_coordinates.length - 1 

        for i in (0..length_of_potential_moves)

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


    for i in (0..@current_node.distance)
        @path.prepend(current.co_ordinates)
        current = current.parent
    end 


    # remove first (starting) move
    @path.shift()
    # # remove end move (dealt with in findpathfunction)
    if @path.length > 1 
        @path.pop()
    end 

    @path

end 


end 



#minim steps only works if i change the name frome mini to minim wtf 
require_relative 'node.rb'

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

    # def minim_steps(x_start, y_start, x_end, y_end)

   
    #     #possible moves of bishop base  # if it starts using diagonals to cut, if x increase then do these moves: etc. 

    #     @x_coordinates = [-1]
    #     @y_coordinates = [+1]


    #     puts "x_coordinates"
    #     p "#{@x_coordinates}"
    #     puts "#{@x_coordinates.length}"


    #     #matrix to track visited spaces

    #     matrix = [
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false],
    #                 [false,false,false,false,false,false,false,false]
    #     ]

    #     visited = matrix


    #     # root = add_node(x_start, y_start, 0)
    #      #pointer
    #      @current_node = add_node(x_start, y_start, 0) 
    #      node_number = 0
  
    #     #set start root node to visited 
    #     visited[x_start][y_start] = true 

        
    #     until @current_node.x == x_end  && @current_node.y == y_end  #||@current_node.y > 7 && @current_node.y < 0 && @current_node.x < 0 && @current_node.x > 7 
            
           
            
    #         #go through possible moves 

    #         length_of_potential_moves = @y_coordinates.length - 1 

    #         for i in (0..length_of_potential_moves)

    #             x = @current_node.x + x_coordinates[i]
    #             y = @current_node.y + y_coordinates[i]

    #             if move_valid?(x,y) && visited[x][y] == false 
    #                 visited[x][y] = true 
    #                 @moves << add_node(x,y,@current_node.distance + 1, @current_node )
    #             end
                
    #         end 

    #         #move to next node in @nodes
    #             node_number += 1 
    #             @current_node = @queue[node_number]
    #             # visited = matrix

           

    #     end 
    #     visited = matrix


    
    # end 
    
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
        p @path
        puts "PRINT PATH "
        @path

    end 


end 
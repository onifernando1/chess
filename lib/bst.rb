# class Node attr_accessor :x, :y, :distance, :co_ordinates, :parent

#     def initialize(x=nil, y=nil, distance=0, parent=nil)
#         @x = x
#         @y =y  
#         @co_ordinates = [x,y]
#         @parent = parent
#     end 


# end 

# class Tree attr_accessor :queue, :moves, :path, :continue

#     def initialize 
#         @queue = []
#         @moves = []
#         @path = []
#         @continue = true 
#     end 

#     def add_node(x, y, distance, parent=nil)
#         node = Node.new(x, y, distance, parent)
#         @queue << node 
#         node
#     end 

#     def move_valid? (x, y)

#         if x < 8 && x > 0 && y < 8 && y > 0 
#             return true 
#         else 
#             return false 
#         end 

#     end 

#     def min_steps(x_start, y_start, x_end, y_end)

#         #check if in board



#         unless move_valid?(x_start, y_start) && move_valid?(x_end, y_end)
#             puts "OUTSIDE OF BOARD"
#             @continue = false 
#             return 
#         end 

   
#         #possible moves of knight 

#         x_coordinates = [+2, +2, -2, -2, +1, +1, -1, -1]
#         y_coordinates = [+1, -1, +1, -1, +2, -2, +2, -2]



#         #matrix to track visited spaces

#         matrix = [
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false],
#                     [false,false,false,false,false,false,false,false]
#         ]

#         visited = matrix


#         # root = add_node(x_start, y_start, 0)
#          #pointer
#          @current_node = add_node(x_start, y_start, 0) 
#          node_number = 0
  
#         #set start root node to visited 
#         visited[x_start][y_start] = true 

       
        
#         until @current_node.x == x_end && @current_node.y == y_end 
            

#             #go through possible moves 

#             for i in (0..7)

#                 x = @current_node.x + x_coordinates[i]
#                 y = @current_node.y + y_coordinates[i]

#                 if move_valid?(x,y) && visited[x][y] == false 
#                     visited[x][y] = true 
#                     @moves << add_node(x,y,@current_node.distance + 1, @current_node )
#                 end
                

#             end 

#             #move to next node in @nodes
#                 node_number += 1 
#                 @current_node = @queue[node_number]
#                 # visited = matrix
                

#         end 
#         visited = matrix


    
#     end 
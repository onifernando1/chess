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
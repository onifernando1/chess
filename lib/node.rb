

class Node attr_accessor :x, :y, :distance, :co_ordinates, :parent

    def initialize(x=nil, y=nil, distance=0, parent=nil)
        @x = x
        @y = y  
        @co_ordinates = [x,y]
        @parent = parent
        @distance = distance
    end 


end 
# frozen_string_literal: true

require_relative 'node'

class Tree
  attr_accessor :queue, :moves, :path, :continue, :distance, :current_node, :node

  def initialize
    @queue = []
    @moves = []
    @path = []
    @continue = true
  end

  def add_node(x, y, distance, parent = nil)
    node = Node.new(x, y, distance, parent)
    @queue << node
    node
  end

  def move_valid?(x, y)
    if x < 8 && x >= 0 && y < 8 && y >= 0
      true
    else
      false
    end
  end

  def print_path
    current = @current_node

    (0..@current_node.distance).each do |_i|
      @path.prepend(current.co_ordinates)
      current = current.parent
    end

    # remove first (starting) move
    @path.shift
    # # remove end move (dealt with in findpathfunction)
    @path.pop if @path.length > 1

    @path
  end
end

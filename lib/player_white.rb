# frozen_string_literal: true

require_relative 'player'

class PlayerWhite < Player
  attr_accessor :name
  attr_reader :colour

  def initialize
    super
    @colour = 'white'
  end

  def get_name
    puts 'White: Enter your name'
    super
  end
end

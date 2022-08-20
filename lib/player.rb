# frozen_string_literal: true

class Player
  def initialize
    @name = ''
  end

  def get_name
    @name = gets.chomp
  end
end

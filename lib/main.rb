# frozen_string_literal: true
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'colorize', require: false
end

require_relative 'game'

game = Game.new
game.game
game.win_message
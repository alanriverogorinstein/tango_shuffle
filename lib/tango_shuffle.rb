# frozen_string_literal: true

require_relative "tango_shuffle/version"

module TangoShuffle
  class Error < StandardError; end
  # Your code goes here...
end

class Array
  def shuffle
    sort_by { rand }
  end
end

class ShufflePlayer
  def initialize(files)
    @files = files
  end

  def play
    @files.shuffle.each { |file| play_file(file) }
  end

  private

  # Deploy using afplay to confirm it works, then change to a non-mac command-line audio player.
  def play_file(file)
    system("afplay #{file}")
  end
end

sp = ShufflePlayer.new(ARGV)
sp.play

# Test why it doesn't show up in Ruby Gems

require "jarvis/version"
require "jarvis/cli"
require "jarvis/initializer"
require "pathname"

module Jarvis
  def self.root
    Pathname.new(".")
  end
  # Your code goes here...
end

require "jarvis/version"
require "jarvis/cli"
require "jarvis/initializer"
require "jarvis/file"
require "jarvis/file/repository"
require "jarvis/file/validator"
require "jarvis/scanner"
require "jarvis/problem"
require "jarvis/problem/repository"

require "pathname"

module Jarvis
  def self.root
    Pathname.new(".")
  end
end

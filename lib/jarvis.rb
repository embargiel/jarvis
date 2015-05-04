require "jarvis/version"
require "jarvis/cli"
require "jarvis/initializer"
require "jarvis/file"
require "jarvis/file/repository"
require "jarvis/file/validator"
require "jarvis/file/iterator"
require "jarvis/scanner"
require "jarvis/problem"
require "jarvis/problem/repository"
require "jarvis/reporter"
require "jarvis/fixer"
require "jarvis/fixer/empty_file_fixer"
require "jarvis/fixer/missing_newline_at_end_fixer"
require "jarvis/fixer/empty_helper_file_fixer"
require "jarvis/fixer/trailing_whitespace_fixer"
require "jarvis/checker"
require "jarvis/seek_and_destroy"

require "pathname"

module Jarvis
  def self.root
    Pathname.new(".")
  end
end

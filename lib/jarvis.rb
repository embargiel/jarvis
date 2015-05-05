require 'require_all'
require "pathname"
require "ruby-progressbar"
require "fileutils"
require "yaml/store"

require_rel ""

module Jarvis
  def self.root
    Pathname.new(".")
  end
end

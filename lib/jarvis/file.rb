module Jarvis
  class File
    attr_reader :path

    def self.create(attrs)
      new(attrs[:path])
    end

    def initialize(path)
      @path = path
    end

    def lines
      ::File.readlines(@path)
    end

    def to_h
      {
        path: @path
      }
    end
  end
end
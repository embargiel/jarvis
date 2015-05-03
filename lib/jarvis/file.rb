module Jarvis
  class File
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def to_h
      {
        path: @path
      }
    end
  end
end
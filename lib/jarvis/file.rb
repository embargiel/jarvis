module Jarvis
  class File
    attr_reader :path

    def self.create(attrs)
      new(attrs[:path])
    end

    def initialize(path)
      @path = path
    end

    def filename
      @path.split("/").last
    end

    def lines
      ::File.readlines(@path)
    end

    def nonempty?
      !empty?
    end

    def empty?
      ::File.zero? @path
    end

    def read
      Pathname.new(@path).read
    end

    def delete
      Pathname.new(@path).delete
    end

    def open(attrs)
      Pathname.new(@path).open(attrs) do |f|
        yield(f)
      end
    end

    def to_h
      {
        path: @path
      }
    end
  end
end

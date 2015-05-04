module Jarvis
  class Problem
    attr_reader :checker, :file_path

    def self.create(attrs)
      new(attrs[:checker], attrs[:file_path])
    end

    def initialize(checker, file_path)
      @checker   = checker
      @file_path = file_path
    end

    def file
      Jarvis::File.new(@file_path)
    end
  end
end

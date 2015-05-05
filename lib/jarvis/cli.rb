module Jarvis
  class CLI < Thor
    desc "checkers", "writes list of all available checkers"
    def checkers
      Checker.all.each do |checker|
        puts checker.name
      end
    end

    desc "seek_and_destroy", "finds all instances violating given checker and fixes them"
    def seek_and_destroy(checker_name)
      SeekAndDestroy.new(checker_name).call
    end

    desc "find", "finds all instances violating given checker and lists them"
    def find(checker_name)
      Finder.new(checker_name).call
    end
  end
end

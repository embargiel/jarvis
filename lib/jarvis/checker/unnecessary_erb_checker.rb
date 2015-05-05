module Jarvis
  class UnnecessaryErbChecker
    def initialize
      @counter = 0
    end

    def file=(file)
      @file = file
    end

    def should_check?
      @file.lines.any? and @file.path.include? ".erb"
    end

    def problem_present?
      !(@file.read.include? "<%")
    end

    def name
      :unnecessary_erb
    end

    def description
      # scanning for...
      "files unnecessary erb extension"
    end

    def increment
      @counter += 1
    end

    def problem_hash
      {
        file_path: @file.path,
        checker: name
      }
    end

    def report
      "#{@counter} files have unnecessary erb extension"
    end
  end
end

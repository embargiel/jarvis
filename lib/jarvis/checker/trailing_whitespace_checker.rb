module Jarvis
  class TrailingWhitespaceChecker
    def initialize
      @counter = 0
    end

    def file=(file)
      @file = file
    end

    def should_check?
      @file.nonempty?
    end

    def problem_present?
      @file.lines.any? do |line|
        line.chomp[-1] == " "
      end
    end

    def name
      :trailing_whitespace
    end

    def description
      # scanning for...
      "files with trailing whitespace"
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
      "#{@counter} files have trailing whitespace"
    end
  end
end

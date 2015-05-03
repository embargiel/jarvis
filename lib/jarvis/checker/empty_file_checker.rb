module Jarvis
  class EmptyFileChecker
    def initialize
      @counter = 0
    end

    def file=(file)
      @file = file
    end

    def should_check?
      true
    end

    def problem_present?
      @file.lines.empty?
    end

    def name
      :empty_file
    end

    def description
      # scanning for...
      "empty files"
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
      "#{@counter} files are empty"
    end
  end
end

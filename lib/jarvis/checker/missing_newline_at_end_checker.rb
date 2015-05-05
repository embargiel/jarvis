module Jarvis
  class MissingNewlineAtEndChecker
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
      !@file.lines.last.include? "\n"
    end

    def name
      :missing_newline_at_end
    end

    def description
      # scanning for...
      "missing new lines at the end"
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
      "#{@counter} files have missing newline at the end"
    end
  end
end

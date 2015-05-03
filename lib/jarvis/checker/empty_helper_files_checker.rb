module Jarvis
  class EmptyHelperFileChecker
    def initialize
      @counter = 0
    end

    def file=(file)
      @file = file
    end

    def should_check?
      @file.path.include? "_helper.rb"
    end

    def problem_present?
      lines = @file.lines
      return false if lines.length > 3

      filename = @file.filename
      helper_name = filename.split("_").first.capitalize

      lines.first == "module #{helper_name}Helper\n" and lines.last == "end\n"
    end

    def name
      :empty_helper_file
    end

    def description
      # scanning for...
      "empty helper files"
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
      "#{@counter} empty helper files found"
    end
  end
end

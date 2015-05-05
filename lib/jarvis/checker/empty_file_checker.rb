module Jarvis
  class EmptyFileChecker < Checker::Base
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

    def report
      "#{@counter} files are empty"
    end
  end
end

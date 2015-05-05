module Jarvis
  class EmptyHelperFileChecker < Checker::Base
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

    def report
      "#{@counter} empty helper files found"
    end
  end
end

module Jarvis
  class TrailingWhitespaceChecker < Checker::Base
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

    def report
      "#{@counter} files have trailing whitespace"
    end
  end
end

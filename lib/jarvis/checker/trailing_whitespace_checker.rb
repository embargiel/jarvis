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
  end
end

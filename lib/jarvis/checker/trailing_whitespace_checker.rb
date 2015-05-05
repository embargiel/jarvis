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

    def solve
      new_version = @file.lines.map do |line|
        "#{line.rstrip}\n"
      end.join("")

      @file.open("w") do |f|
        f.puts new_version
      end
    end
  end
end

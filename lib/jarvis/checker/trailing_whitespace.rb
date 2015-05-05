module Jarvis
  class Checker
    class TrailingWhitespace
      def should_check?
        @file.nonempty?
      end

      def problem_present?
        @file.read.include? " \n"
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
end

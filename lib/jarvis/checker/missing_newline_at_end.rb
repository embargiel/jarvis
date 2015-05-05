module Jarvis
  class Checker
    class MissingNewlineAtEnd
      def should_check?
        @file.nonempty?
      end

      def problem_present?
        !@file.read.ends_with? "\n"
      end

      def solve
        @file.open("a") do |f|
          f << "\n"
        end
      end
    end
  end
end

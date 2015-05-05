module Jarvis
  class Checker
    class EmptyFile
      def should_check?
        true
      end

      def problem_present?
        @file.empty?
      end

      def solve
        @file.delete
      end
    end
  end
end

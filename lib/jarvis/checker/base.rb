module Jarvis
  class Checker
    class Base
      def initialize
        @counter = 0
      end

      def file=(file)
        @file = file
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
    end
  end
end

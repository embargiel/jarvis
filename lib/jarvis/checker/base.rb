module Jarvis
  class Checker
    class Base
      def file=(file)
        @file = file
      end

      def name
        self.class.name.split("::").last.sub("Checker", "").underscore.to_sym
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

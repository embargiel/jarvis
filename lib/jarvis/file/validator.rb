module Jarvis
  class File
    class Validator
      def initialize(file)
        @file = file
      end

      def valid?
        file? and acceptable_extension? and acceptable_path?
      end

      private

      def acceptable_extension?
        Jarvis::Config.new.file_extensions_blacklist.none? do |extension|
          @file.path.include? ".#{extension}"
        end
      end

      def file?
        Pathname.new(@file.path).file?
      end

      def acceptable_path?
        Jarvis::Config.new.paths_blacklist.none? do |extension|
          @file.path.include? "#{extension}"
        end
      end
    end
  end
end

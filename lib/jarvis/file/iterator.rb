module Jarvis
  class File
    class Iterator
      def each_valid_file
        all_valid_files.each do |file|
          yield(file)
        end
      end

      def count
        all_valid_files.count
      end

      private

      def all_valid_files
        @all_valid_files ||= Dir["./**/*"].map{|path| Jarvis::File.create(path: path) }.keep_if{|file| Jarvis::File::Validator.new(file).valid? }
      end
    end
  end
end

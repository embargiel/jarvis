module Jarvis
  class Initializer
    def call
      file_repository.drop
      file_iterator = File::Iterator.new

      progress_bar = ProgressBar.create(total: file_iterator.count, title: "Indexing files")

      file_iterator.each_valid_file do |file|
        file_repository.save(file)
        progress_bar.increment
      end

      file_repository.flush!
      report!
    end

    def report!
      puts "#{file_repository.count} files successfully indexed"
    end

    private

    def file_repository
      @file_repository ||= Jarvis::File::Repository.new
    end

    def all_files
      @all_files ||= Dir["./**/*"]
    end
  end
end

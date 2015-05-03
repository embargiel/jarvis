require "ruby-progressbar"

module Jarvis
  class Initializer
    def call
      file_repository.drop

      files_count = all_files.count
      progress_bar = ProgressBar.create(total: files_count, title: "Indexing files")

      all_files.each do |path|
        file = Jarvis::File.create(path: path)
        validator = Jarvis::File::Validator.new(file)
        if validator.valid?
          file_repository.save(file)
        end
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
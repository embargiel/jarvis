require "jarvis/file"
require "jarvis/file/repository"
require "jarvis/file/validator"

module Jarvis
  class Initializer
    def call
      file_repository = Jarvis::File::Repository.new
      file_repository.drop

      Dir["./**/*"].each do |path|
        file = Jarvis::File.new(path)
        validator = Jarvis::File::Validator.new(file)
        if validator.valid?
          file_repository.save(file)
        end
      end
    end
  end
end
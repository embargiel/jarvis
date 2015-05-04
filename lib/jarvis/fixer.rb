module Jarvis
  class Fixer
    def self.find(name)
      {
        empty_file: EmptyFileFixer.new,
        missing_newline_at_end: MissingNewLineAtEndFixer.new
      }[name.to_sym]
    end
  end
end

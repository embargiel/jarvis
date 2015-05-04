module Jarvis
  class Fixer
    def self.find(name)
      {
        empty_file: EmptyFileFixer.new,
        missing_newline_at_end: MissingNewLineAtEndFixer.new,
        empty_helper_file: EmptyHelperFileFixer.new,
        trailing_whitespace: TrailingWhitespaceFixer.new
      }[name.to_sym]
    end
  end
end

module Jarvis
  class Checker
    def self.all
      [
        Jarvis::EmptyFileChecker.new,
        Jarvis::MissingNewlineAtEndChecker.new,
        Jarvis::TrailingWhitespaceChecker.new,
        Jarvis::EmptyHelperFileChecker.new
      ]
    end
  end
end

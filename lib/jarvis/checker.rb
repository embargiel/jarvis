module Jarvis
  class Checker
    def self.find(name)
      all.find{|checker| checker.name == name.to_sym }
    end

    def self.all
      [
        Jarvis::EmptyFileChecker.new,
        Jarvis::MissingNewlineAtEndChecker.new,
        Jarvis::TrailingWhitespaceChecker.new,
        Jarvis::EmptyHelperFileChecker.new,
        Jarvis::UnnecessaryErbChecker.new
      ]
    end
  end
end

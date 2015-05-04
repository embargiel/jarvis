module Jarvis
  class CLI < Thor
    desc "init", "prepares jarvis to do his work"
    def init
      Initializer.new.call
    end

    desc "scan", "looks for problems in scanned files"
    def scan
      Scanner.new.call
    end

    desc "status", "presents status of found problems"
    def status
      Reporter.new.call
    end

    desc "fixall", "fixes problems with for passed checker name"
    def fixall(checker_name)
      Fixer.find(checker_name).call
    end

    desc "checkers", "writes list of all available checkers"
    def checkers
      Checker.all.each do |checker|
        puts checker.name
      end
    end
  end
end

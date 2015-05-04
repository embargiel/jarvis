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
  end
end

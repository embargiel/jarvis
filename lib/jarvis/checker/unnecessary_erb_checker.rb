module Jarvis
  class UnnecessaryErbChecker < Checker::Base
    def should_check?
      @file.nonempty? and @file.path.include? ".erb"
    end

    def problem_present?
      !(@file.read.include? "<%")
    end

    def name
      :unnecessary_erb
    end

    def description
      # scanning for...
      "files unnecessary erb extension"
    end

    def report
      "#{@counter} files have unnecessary erb extension"
    end
  end
end

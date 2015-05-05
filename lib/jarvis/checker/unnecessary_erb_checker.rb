module Jarvis
  class UnnecessaryErbChecker < Checker::Base
    def should_check?
      @file.nonempty? and @file.path.include? ".erb"
    end

    def problem_present?
      !(@file.read.include? "<%")
    end

    def report
      "#{@counter} files have unnecessary erb extension"
    end
  end
end

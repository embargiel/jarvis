module Jarvis
  class UnnecessaryErbChecker < Checker::Base
    def should_check?
      @file.nonempty? and @file.path.include? ".erb"
    end

    def problem_present?
      !(@file.read.include? "<%")
    end

    def solve
      old_path = @file.path
      new_path = @file.path.gsub(".erb", "")
      FileUtils.mv old_path, new_path
    end
  end
end

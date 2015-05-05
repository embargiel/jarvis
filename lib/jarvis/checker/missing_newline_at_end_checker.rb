module Jarvis
  class MissingNewlineAtEndChecker < Checker::Base
    def should_check?
      @file.nonempty?
    end

    def problem_present?
      !@file.lines.last.include? "\n"
    end
  end
end

require "jarvis/checker/empty_file_checker"
require "jarvis/checker/missing_newline_at_end_checker"
require "jarvis/checker/trailing_whitespace_checker"

require "ruby-progressbar"
require 'pry'

module Jarvis
  class Scanner
    def call
      problems_repository.drop

      checkers = [
        Jarvis::EmptyFileChecker.new,
        Jarvis::MissingNewlineAtEndChecker.new,
        Jarvis::TrailingWhitespaceChecker.new
      ]
      reports  = []

      checkers.each do |problem_checker|
        progress_bar = ProgressBar.create(total: file_repository.count, title: "Scanning for #{problem_checker.description}")
        file_repository.all.each do |file|
          problem_checker.file = file

          if problem_checker.should_check?
            if problem_checker.problem_present?
              problem_checker.increment
              problem_hash = problem_checker.problem_hash
              problems_repository.save(problem_hash)
            end
          end

          progress_bar.increment
        end

        reports << problem_checker.report

        problems_repository.flush!
      end

      reports.each do |report|
        puts report
      end
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end

    def file_repository
      @file_repository ||= Jarvis::File::Repository.new
    end
  end
end

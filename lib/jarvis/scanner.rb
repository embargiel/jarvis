module Jarvis
  class Scanner
    def call
      problems_repository.drop

      reports  = []

      Checker.all.each do |problem_checker|
        progress_bar = ProgressBar.create(total: file_repository.count, title: "Scanning for #{problem_checker.name}")
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

        reports << "#{problem_checker.counter} instances of #{problem_checker.name} found"
      end

      problems_repository.flush!

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

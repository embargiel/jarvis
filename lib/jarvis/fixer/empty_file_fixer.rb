module Jarvis
  class EmptyFileFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :empty_file }
      problems.each do |pr|
        solve(pr)
      end

      problems_repository.delete_if { |problem| problem.checker == :empty_file }

      puts "Removed #{problems.count} empty files"
    end

    def solve(problem)
      problem.file.delete
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

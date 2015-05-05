require "fileutils"

module Jarvis
  class UnnecessaryErbFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :unnecessary_erb }
      problems.each do |pr|
        solve(pr)
      end

      problems_repository.delete_if { |problem| problem.checker == :unnecessary_erb }

      puts "Cleaned up unnecessary erb extensions in #{problems.count} files"
    end

    def solve(problem)
      old_path = problem.file.path
      new_path = problem.file.path.gsub(".erb", "")
      FileUtils.mv old_path, new_path
      # puts problem
      # problem.file.open("a") do |f|
      #   f << "\n"
      # end
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

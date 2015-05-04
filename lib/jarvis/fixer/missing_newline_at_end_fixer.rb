module Jarvis
  class MissingNewLineAtEndFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :missing_newline_at_end }
      problems.each do |pr|
        pr.file.open("a") do |f|
          f << "\n"
        end
      end

      problems_repository.delete_if { |problem| problem.checker == :missing_newline_at_end }

      puts "Cleaned up whitelines in #{problems.count} files"
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

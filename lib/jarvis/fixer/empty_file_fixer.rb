module Jarvis
  class EmptyFileFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :empty_file }
      problems.each do |pr|
        pr.file.delete
      end

      problems_repository.delete_if { |problem| problem.checker == :empty_file }

      puts "Removed #{problems.count} empty files"
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

module Jarvis
  class TrailingWhitespaceFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :trailing_whitespace }
      problems.each do |pr|
        solve(pr)
      end

      problems_repository.delete_if { |problem| problem.checker == :trailing_whitespace }

      puts "Cleaned up trailing whitespace in #{problems.count} files"
    end

    def solve(problem)
      new_version = problem.file.lines.map do |line|
        "#{line.rstrip}\n"
      end.join("")

      problem.file.open("w") do |f|
        f.puts new_version
      end
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

module Jarvis
  class TrailingWhitespaceFixer
    def call
      problems = problems_repository.all.find_all{|problem| problem.checker == :trailing_whitespace }
      problems.each do |pr|
        new_version = pr.file.lines.map do |line|
          "#{line.rstrip}\n" rescue binding.pry
        end.join("")

        pr.file.open("w") do |f|
          f.puts new_version
        end
        #   new_file = f.each_line.map do |line|
        #   end

        #   binding.pry
        #   # f.
        # end
      end

      problems_repository.delete_if { |problem| problem.checker == :trailing_whitespace }

      puts "Cleaned up trailing whitespace in #{problems.count} files"
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

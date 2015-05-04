module Jarvis
  class Reporter
    def call
      counter_hash = problems_repository.all.group_by{|problem| problem.checker }
      puts "Problems count found by jarvis:"
      counter_hash.each do |checker_name, problems_array|
        puts "#{checker_name}: #{problems_array.count}"
        puts "-> jarvis fixall #{checker_name}"
        puts ""
      end
    end

    private

    def problems_repository
      @problems_repository ||= Jarvis::Problem::Repository.new
    end
  end
end

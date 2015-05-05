module Jarvis
  class Finder
    def initialize(checker_name)
      @checker_name = checker_name
    end

    def call
      checker = Checker.find(@checker_name)
      paths = []

      if checker
        file_iterator = File::Iterator.new
        progress_bar = ProgressBar.create(total: file_iterator.count, title: "Looking for #{@checker_name}")
        file_iterator.each_valid_file do |file|
          checker.file = file
          if checker.should_check? and checker.problem_present?
            paths << file.path
          end
          progress_bar.increment
        end

        if paths.any?
          puts "Jarvis found #{paths.count} instances of #{@checker_name}:"
          paths.each do |path|
            puts "  #{path}"
          end
        else
          puts "none"
        end

      else
        puts "Jarvis can't find #{@checker_name }"
      end
    end
  end
end

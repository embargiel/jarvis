module Jarvis
  class SeekAndDestroy
    def initialize(checker_name)
      @checker_name = checker_name.to_sym
    end

    def call
      checker = Checker.find(@checker_name)
      fixer   = Fixer.find(@checker_name)

      if checker and fixer
        file_iterator = File::Iterator.new
        progress_bar = ProgressBar.create(total: file_iterator.count, title: "Seeking and destroying #{@checker_name}")
        file_iterator.each_valid_file do |file|
          checker.file = file
          if checker.should_check? and checker.problem_present?
            problem_hash = checker.problem_hash
            problem = Problem.create(problem_hash)
            fixer.solve(problem)
          end

          progress_bar.increment
        end
      else
        puts "Jarvis can't help you with #{@checker_name}"
      end
    end
  end
end

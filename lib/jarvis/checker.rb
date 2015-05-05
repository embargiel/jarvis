module Jarvis
  class Checker
    def self.all_strategies
      constants.map{|c| c.to_s.underscore }
    end

    def initialize(strategy_name)
      @strategy_name = strategy_name
    end

    def file=(file)
      strategy.instance_variable_set("@file", file)
    end

    def should_check?
      strategy.should_check?
    end

    def problem_present?
      strategy.problem_present?
    end

    def solve
      strategy.solve
    end

    private

    def strategy
      @strategy ||= "Jarvis::Checker::#{@strategy_name.camelize}".constantize.new
    end
  end
end

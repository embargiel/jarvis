module Jarvis
  class Problem
    class Repository
      def save(problem_report)
        temporary_array << problem_report

        # store.transaction do
        #   store['problems'] ||= []
        #   store['problems'] << problem_report
        # end
      end

      def drop
        store.transaction do
          store['problems'] = []
        end
      end

      def flush!
        store.transaction do
          store['problems'] += temporary_array
        end
        @temporary_array = []
      end

      private

      def temporary_array
        @temporary_array ||= []
      end

      def store
        @store ||= YAML::Store.new(store_file)
      end

      def store_file
        Jarvis.root.join(".jarvis.yml")
      end
    end
  end
end

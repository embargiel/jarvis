require "yaml/store"
require "pathname"

module Jarvis
  class File
    class Repository
      def save(file)
        store.transaction do
          store['files'] ||= []
          store['files'] << file.to_h
        end
      end

      def drop
        store_file.delete if store_file.exist?
        @store = nil
      end

      private

      def store
        @store ||= YAML::Store.new(store_file)
      end

      def store_file
        Jarvis.root.join(".jarvis.yml")
      end
    end
  end
end
require "yaml/store"
require "pathname"

module Jarvis
  class File
    class Repository
      def save(file)
        temporary_array << file.to_h
      end

      def flush!
        store.transaction do
          store['files'] = temporary_array
        end
        @temporary_array = []
      end

      def drop
        store.transaction do
          store['files'] = []
        end
      end

      def count
        store.transaction do
          store['files'].count
        end
      end

      def all
        store.transaction do
          store['files'].map{|h| Jarvis::File.create(h)}
        end
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

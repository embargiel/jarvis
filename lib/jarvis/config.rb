module Jarvis
  class Config
    def file_extensions_blacklist
      ["png", "jpg", "ttf", "eot", "woff"]
    end

    def paths_blacklist
      ["./tmp/cache"]
    end
  end
end
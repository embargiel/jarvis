module Jarvis
  class Config
    def file_extensions_blacklist
      ["png", "jpg", "gif", "ttf", "eot", "woff"]
    end

    def paths_blacklist
      ["./tmp/"]
    end
  end
end

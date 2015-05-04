module Jarvis
  class Config
    def file_extensions_blacklist
      ["png", "jpg", "gif", "ttf", "eot", "woff", "odg"]
    end

    def paths_blacklist
      ["./tmp/", "./doc/history", "./public"]
    end
  end
end

require "thor"
require "onsengame/version"
require "onsengame/window"

module Onsengame
  class Command < Thor
    desc "version", "Show version"
    def version
      puts(VERSION)
    end

    desc "demo [OPTIONS]", "Run demo"
    option :fullscreen, type: :boolean
    def demo
      @window = Window.new(options.dup)
      @window.show
    end
  end
end

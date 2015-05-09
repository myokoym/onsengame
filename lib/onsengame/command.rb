require "thor"
require "onsengame/generator"
require "onsengame/version"
require "onsengame/window"

module Onsengame
  class Command < Thor
    register(Generator::New, "new", "new NAME", "Generate new game")

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

require "fileutils"
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

    desc "generate NAME", "Generate project"
    def generate(name)
      raise "Error: File exists." if File.exist?(name)

      onsengame_dir = File.expand_path("../../..", __FILE__)
      paths = Dir.glob("#{onsengame_dir}/*")
      paths << File.join(onsengame_dir, ".gitignore")
      paths.each do |path_from|
        FileUtils.mkdir_p(name)
        path_to = File.join(name, File.basename(path_from))
        FileUtils.cp_r(path_from, path_to)
      end

      FileUtils.cd(name) do
        system("git", "init")
        system("git", "add", ".")
        system("git", "commit -m 'Initial commit'")
        system("rename_project", "onsengame", name)
      end
    end
  end
end

require "thor"

module Onsengame
  module Generator
    class New < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), "template", "new")
      end

      def create_lib_file
        [
          "NAME",
          "NAME/command",
          "NAME/object",
          "NAME/object/base",
          "NAME/scene",
          "NAME/scene/base",
          "NAME/scene/title",
          "NAME/scene/main",
          "NAME/version",
          "NAME/window",
          "NAME/z_order",
        ].each do |path|
          template("lib/#{path}.tt",
                   "#{name}/lib/#{path.gsub("NAME", name)}.rb")
        end
      end

      def create_bin_file
        [
          "NAME",
        ].each do |path|
          src = "bin/#{path}.tt"
          dist = "#{name}/bin/#{path.gsub("NAME", name)}"
          template(src, dist)
          chmod(dist, 0755)
        end
      end

      def create_root_file
        config = {
          name: `git config user.name`.chomp,
          email: `git config user.email`.chomp
        }

        [
          "NAME.gemspec",
          ".gitignore",
          "Gemfile",
          "LICENSE.txt",
          "Rakefile",
          "README.md",
        ].each do |path|
          template("#{path}.tt",
                   "#{name}/#{path.gsub("NAME", name)}",
                   config)
        end
      end
    end
  end
end

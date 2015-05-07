require "gosu"
require "gosu/swig_patches"
require "gosu/patches"
require "onsengame/scene"

module Onsengame
  class Window < Gosu::Window
    attr_reader :options, :scenes
    def initialize(options={})
      width = options[:width] || 640
      height = options[:height] || 480
      fullscreen = options[:fullscreen] || false
      super(width, height, fullscreen)
      self.caption = "Onsengame"
      @options = options
      @options[:font_dir] ||= File.expand_path("../../../data/fonts", __FILE__)
      @scenes = []
      @scenes << Scene::Title.new(self)
    end

    def update
      current_scene.update
    end

    def draw
      current_scene.draw
    end

    def button_down(id)
      case id
      when Gosu::KbEscape
        close
      else
        current_scene.button_down(id)
      end
    end

    def current_scene
      @scenes[0]
    end

    def draw_rectangle(x1, y1, x2, y2, color, z_order)
      draw_quad(x1, y1, color,
                x2, y1, color,
                x2, y2, color,
                x1, y2, color,
                z_order)
    end

    def draw_rectangle_outline(x1, y1, x2, y2, color, z_order)
      draw_line(x1, y1, color,
                x2, y1, color,
                z_order)
      draw_line(x1, y1, color,
                x1, y2, color,
                z_order)
      draw_line(x1, y2, color,
                x2, y2, color,
                z_order)
      draw_line(x2, y1, color,
                x2, y2, color,
                z_order)
    end
  end
end

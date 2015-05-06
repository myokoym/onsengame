require "gosu"
require "onsengame/object"
require "onsengame/z_order"
require "onsengame/scene/base"

module Onsengame
  module Scene
    class Main
      include Base

      def initialize(window)
        super
      end

      def update
        super
      end

      def draw
        super
      end

      def button_down(id)
        case id
        when Gosu::KbQ
          @window.scenes.shift
        end
      end
    end
  end
end

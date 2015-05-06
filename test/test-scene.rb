require "onsengame"

class TestScene < Test::Unit::TestCase
  def setup
    options = {
      width: 1,
      height: 1,
    }
    @window = Onsengame::Window.new(options)
  end

  class TitleTest < self
    def test_new
      assert_not_nil(Onsengame::Scene::Title.new(@window))
    end
  end

  class MainTest < self
    def test_main
      assert_not_nil(Onsengame::Scene::Main.new(@window))
    end
  end
end

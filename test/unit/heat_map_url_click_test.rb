require 'test/unit'
require 'test/lib/plugin_t_path_loader'

class HeatMapUrlClickTest < Test::Unit::TestCase
  def setup
    Fixtures.create_fixtures(FIXTURES_PTH, 'heat_map_clicks')
    Fixtures.create_fixtures(FIXTURES_PTH, 'heat_map_urls')
  end

  def test_addToNewUrl
    originnally = HeatMapUrl.count
    pageClicks = HeatMapUrl.addClick("/", 0, 0)
    assert_not_nil pageClicks
    assert_equal 1, pageClicks.clicks.length
    assert_equal 0, pageClicks.clicks[0].x
    assert_equal 0, pageClicks.clicks[0].y
    assert_equal originnally + 1, HeatMapUrl.count
  end

  def test_addToAnExisting
    originnally = HeatMapUrl.count
    originnallyClicks = HeatMapClick.count
    pageClicks = HeatMapUrl.addClick("/services", 0, 0)
    pageClicks = HeatMapUrl.addClick("/services", 2, 8)
    assert_not_nil pageClicks
    assert_equal 3, pageClicks.clicks.length
    assert_equal 2, pageClicks.clicks.last.x
    assert_equal 8, pageClicks.clicks.last.y
    assert_equal originnally, HeatMapUrl.count
    assert_equal originnallyClicks + 2, HeatMapClick.count
  end
end

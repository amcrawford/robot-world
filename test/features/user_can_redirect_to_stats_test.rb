require_relative '../test_helper'
require 'tilt/erb'

class VisitStatsfromHomepageTest < FeatureTest
  def test_it_visits_analytics
    skip
    visit '/'
      click_link("stats_button")
      assert_equal '/robots/analytics', current_path
  end
end

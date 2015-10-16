require_relative '../test_helper'
require 'tilt/erb'

class VisitIndexfromHomepageTest < FeatureTest
  def test_it_visits_index
    skip
    visit '/'
      click_link("index_button")
      assert_equal '/robots', current_path
  end
end

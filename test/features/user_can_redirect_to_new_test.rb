require_relative '../test_helper'
require 'tilt/erb'

class VisitNewfromHomepageTest < FeatureTest
  def test_it_visits_new_page
    skip
    visit '/'
      click_link("new_button")
      assert_equal '/robots/new', current_path
  end
end

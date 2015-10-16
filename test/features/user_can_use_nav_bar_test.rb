require_relative '../test_helper'
require 'tilt/erb'

class UseLayoutNavBarTest < FeatureTest
  def test_it_refreshes_home
    skip
    visit '/'
      click_link("bottom_nav_home")
      assert_equal '/', current_path
  end

  def test_it_visits_new_form
    skip
    visit '/'
      click_link("bottom_nav_new")
      assert_equal '/robots/new', current_path
  end

  def test_it_visits_index
    skip
    visit '/'
      click_link("bottom_nav_index")
      assert_equal '/robots', current_path
  end
end
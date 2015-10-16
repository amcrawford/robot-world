require_relative '../test_helper'
require 'tilt/erb'

class CreateRobotTest < FeatureTest
  def test_user_can_submit_new_robot
    skip
    visit '/robots/new'
      assert_equal "/robots/new", current_path

      fill_in("robot[name]", with: "Name")
      fill_in("robot[city]", with: "asd")
      fill_in("robot[state]", with: "asdfg")
      fill_in("robot[avatar]", with: "fdkjghsf")
      fill_in("robot[birthdate]", with: "10/1/2014")
      fill_in("robot[date_hired]", with: "10/1/2014")
      fill_in("robot[department]", with: "fdkjghsf")

      click_button "Submit"

      assert_equal "/robots", current_path
      assert page.has_content? "Name"
  end
end

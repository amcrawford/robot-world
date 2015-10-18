require_relative '../test_helper'
require 'tilt/erb'

class EditRobotTest < FeatureTest
  def test_user_can_edit_a_robot
    RobotManager.create({:name => "1", :city => "Baltimore", :state => "MD",
                      :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                      :date_hired => "10/14/2015", :department => "This"})
    visit '/robots'
    click_link("#{RobotManager.all.first.name}")
    click_link("Edit")
    assert_equal "/robots/#{RobotManager.all.first.id}/edit", current_path

    fill_in("robot[name]", with: "Edited Name")
    click_button "Submit"

    assert page.has_content? "Edited Name"
  end
end

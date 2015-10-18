require_relative '../test_helper'
require 'tilt/erb'

class DeleteRobotTest < FeatureTest
  def test_user_can_delete_a_robot
    RobotManager.create({:name => "1", :city => "Baltimore", :state => "MD",
                      :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                      :date_hired => "10/14/2015", :department => "This"})
    assert_equal 1, RobotManager.all.length
    visit '/robots/1'
    click_button("Delete")
    assert_equal "/robots", current_path
    assert_equal 0, RobotManager.all.length
  end
end

require_relative '../test_helper'

class TaskTest < Minitest::Test
    def test_attributes_are_assigned_correctly
      robot = Robot.new({:name => "Amber", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
      assert_equal "MD", robot.state
      assert_equal "Amber", robot.name
    end
end

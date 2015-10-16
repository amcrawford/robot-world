require_relative '../test_helper'

class TestTaskManager < Minitest::Test
  def create_robots(num)
    num.times do |num|
      RobotManager.create({:id => "#{num+1}", :name => "#{num+1}", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
      end
    end

    def test_robot_is_created
      create_robots(1)
      robot = RobotManager.find(RobotManager.all.first.id)
      assert_equal "1", robot.name
      assert_equal "This", robot.department
    end

    def test_prints_all_robots
      create_robots(1)
      assert_equal 1, RobotManager.all.count
      create_robots(1)
      assert_equal 2, RobotManager.all.count
    end

    def test_all_allows_access_to_data
      create_robots(1)
      assert_equal "1", RobotManager.all[0].name
    end

    def test_all_returns_robot_objects
      create_robots(1)
      assert_equal Robot, RobotManager.all[0].class
    end

    def test_it_can_update_name
      create_robots(1)
      assert_equal "1", RobotManager.find(RobotManager.all.first.id).name
      RobotManager.update(RobotManager.all.first.id, {:name => "Amber", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
      assert_equal "Amber", RobotManager.find(RobotManager.all.first.id).name
    end

    def test_it_can_update_department
      create_robots(1)
      assert_equal "This", RobotManager.find(RobotManager.all.first.id).department
      RobotManager.update(RobotManager.all.first.id, {:name => "Amber", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "Sales"})
      assert_equal "Sales", RobotManager.find(RobotManager.all.first.id).department
    end

    def test_it_can_delete_a_robot
      create_robots(1)
      assert_equal 1, RobotManager.all.count
      RobotManager.delete(RobotManager.all.first.id)
      assert_equal 0, RobotManager.all.count
    end
  end

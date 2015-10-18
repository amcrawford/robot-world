require_relative '../test_helper'
require 'tilt/erb'

class IndexRenderTest < FeatureTest
  def setup
    3.times do |num|
      RobotManager.create({:name => "#{num + 1}", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
    end
  end

  def test_user_sees_header
    visit '/robots'
    within("#greeting") do
      assert page.has_content?("Robots")
    end
  end

  def test_it_shows_robots
    visit '/robots'
    within("#robot_list") do
      assert page.has_content?("1")
    end
  end
end

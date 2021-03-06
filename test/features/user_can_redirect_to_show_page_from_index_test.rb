require_relative '../test_helper'
require 'tilt/erb'

class VisitShowfromIndexTest < FeatureTest
  def setup
    1.times do |num|
      RobotManager.create({:name => "#{num + 1}", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
    end
  end

  def test_it_visits_show
    visit '/robots'
      click_link("1")
      assert_equal "/robots/#{RobotManager.all.first.id}", current_path
  end
end

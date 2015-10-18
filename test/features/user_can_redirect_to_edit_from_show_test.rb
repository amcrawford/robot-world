require_relative '../test_helper'
require 'tilt/erb'

class VisitEditfromShowTest < FeatureTest
  def setup
    3.times do |num|
      RobotManager.create({:name => "#{num + 1}", :city => "Baltimore", :state => "MD",
                        :avatar => "http://robohash.org/three", :birthdate => "10/14/2015",
                        :date_hired => "10/14/2015", :department => "This"})
    end
  end

  def test_it_visits_edit
    visit '/robots'
    click_link("#{RobotManager.all.first.name}")
    click_link("Edit")
    assert_equal "/robots/#{RobotManager.all.first.id}/edit", current_path
  end
end

class Analytics

  attr_reader :average_age

  def initialize(all_robots)
    @robots = all_robots
    ages = @robots.map{|robot| robot.age.to_i}
    @average_age = (ages.inject{|sum, age| sum + age})/@robots.length
  end
end

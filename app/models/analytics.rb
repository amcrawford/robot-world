class Analytics

  attr_reader :average_age

  def initialize(all_robots)
    @robots = all_robots
    @average_age = calculate_average_age
  end

  def calculate_average_age
    ages = @robots.map{|robot| robot.age.to_i}
    (ages.inject{|sum, age| sum + age})/@robots.length
  end
end

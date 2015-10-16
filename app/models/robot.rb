
class Robot
  attr_reader :name,
              :city,
              :id,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department,
              :age

  def initialize(data)
    @id          = data[:id]
    @name       = data[:name]
    @city       = data[:city]
    @state      = data[:state]
    @avatar     = data[:avatar]
    @birthdate  = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
    @age = calculate_age
  end

  def calculate_age
    today = [Time.now.year]
    birthday_converted = @birthdate.split("/")
    "#{(today[0].to_i - birthday_converted[2].to_i)}"
  end
end

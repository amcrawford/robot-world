require_relative 'robot'

class RobotManager
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robots_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robots_development.sqlite3")
    end
  end

  def self.create(robot)
    database.from(:robots).insert(:name => robot[:name], :city => robot[:city], :state => robot[:state], :avatar => robot[:avatar], :birthdate => robot[:birthdate], :date_hired => robot[:date_hired], :department => robot[:department])
  end

  def self.all
    robots = database.from(:robots).to_a
    robots.map do |data|
      Robot.new(data)
    end
  end

  def self.find(id)
    Robot.new(database.from(:robots).where(:id => id).to_a.first)
  end

  def self.update(id, params)
    database.from(:robots).where(:id => id).update(:name => params[:name], :city => params[:city], :state => params[:state], :avatar => params[:avatar], :birthdate => params[:birthdate], :date_hired => params[:date_hired], :department => params[:department])
  end

  def self.delete(id)
    database.from(:robots).where(:id => id).delete
  end

  def self.delete_all
    database.from(:robots).delete
  end
end

require_relative '../models/robot_manager'  # => true
require_relative '../models/analytics'      # => true


class RobotWorldApp < Sinatra::Base           # ~> NameError: uninitialized constant Sinatra
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/analytics' do
    @robots = RobotManager.all
    @robot_data = Analytics.new(@robots)
    erb :statistics
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robot/:id' do |id|
    RobotManager.delete(id.to_i)
    redirect "/robots"
  end

end

# ~> NameError
# ~> uninitialized constant Sinatra
# ~>
# ~> /Users/ambercrawford/turing/module_two/robot_world/app/controllers/robot_world_app.rb:5:in `<main>'

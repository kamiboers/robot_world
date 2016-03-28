class RobotWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_world.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

  def robot_world
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      database = Sequel.sqlite("db/robot_world_development.sqlite3")
    end
    @robot_world ||= RobotWorld.new(database)
  end

end

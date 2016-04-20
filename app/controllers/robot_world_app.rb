require 'sinatra'
require 'time'

class RobotWorldApp < Sinatra::Base
  attr_reader :robot_world

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

  def find_all_by_department
    department_array = ((robot_world.all.to_a.each_with_object(Hash.new(0)) { |instance,counts| counts[instance.department] += 1 })
  end

  def average_robot_age
    count = robot_world.dataset.all.to_a.count
    totaled_ages = robot_world.dataset.all.to_a.map { |robot_params| Time.now - Time.parse(robot_params[:birthdate]) }
    (totaled_ages.inject(:+)/count).to_i
  end

end

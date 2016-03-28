require 'sequel'
require 'sqlite3'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:robots)
  end

  def create(robot)
    dataset.insert(robot)
  end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    robot_params = dataset.where(:id => id).to_a.first
    Robot.new(robot_params)
  end

  def update(id, robot)
    dataset.where(:id => id).update(robot)
  end

  def destroy(id)
    dataset.where(:id => id).delete
  end

  def destroy_all
    dataset.delete
  end

end

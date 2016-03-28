ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__ )
require "minitest/autorun"
require "minitest/pride"
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp

module TestHelpers

  def setup
    robot_world.destroy_all
    super
  end

  def id_helper(num)
      num = num - 1
      id = robot_world.all[num].id
    end

  def teardown
    robot_world.destroy_all
    super
  end

  def robot_world
    database = Sequel.sqlite('db/robot_world_test.sqlite3')
    @robot_world ||= RobotWorld.new(database)
  end

  def create_robots(num)
    num.times do |i|
      robot_world.create({
        :name => "Task Title #{i + 1}",
        :city => "Task Description #{i + 1}",
        :state => "State #{i + 1}",
        :birthdate => "Birthdate #{i + 1}",
        :date_hired => "Date Hired #{i + 1}",
        :department => "Department #{i + 1}",
        })
    end
  end
end

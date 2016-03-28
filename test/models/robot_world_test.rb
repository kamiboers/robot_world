require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_world.create({
      :name       => "Name",
      :state => "Nebraska"
    })
    robot = robot_world.all.last

    assert_equal "Name", robot.name
    assert_equal "Nebraska", robot.state
  end

  def test_it_can_find_all_robots
    create_robots(3)

    all_robots = robot_world.all

    assert_equal Array, all_robots.class
    assert_equal 3, all_robots.size
    assert_equal "Name 1", all_robots.first.title
    assert_equal "Name 3", all_robots.last.title
  end

  def test_it_can_find_a_specific_robot
    create_robots(5)

    robot1 = robot_world.find(1)

    assert_equal "Task Title 1", robot1.title
    assert_equal "Task Description 1", robot1.description

    robot3 = robot_world.find(3)

    assert_equal "Task Title 3", robot3.title
    assert_equal "Task Description 3", robot3.description
  end

  # def test_it_can_update_an_existing_robot
  #   create_robots(1)

  #   robot = robot_world.find(1)

  #   assert_equal "Task Title 1", robot.title
  #   assert_equal "Task Description 1", robot.description

  #   updated_robot_info = {title: "New Task Title",
  #                       description: "New Task Description"}

  #   robot_world.update(1, updated_robot_info)

  #   robot = robot_world.find(1)

  #   assert_equal "New Task Title", robot.title
  #   assert_equal "New Task Description", robot.description
  # end

  # def test_it_can_destroy_a_robot
  #   create_robots(1)

  #   all_robots = robot_world.all

  #   assert_equal 1, all_robots.size
  #   assert all_robots.any? { |robot| robot.title == "Task Title 1" }

  #   robot_world.destroy(1)

  #   all_robots = robot_world.all

  #   assert_equal 0, all_robots.size
  #   refute all_robots.any? { |robot| robot.title == "Task Title 1" }
  # end
end

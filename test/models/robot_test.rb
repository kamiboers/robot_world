require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({ :name       => "Name",
                      :city => "City",
                      :state          => "State",
                      :birthdate => "Birthdate",
                      :date_hired => "Date Hired",
                      :department => "Department",
                      :id => 1 })

    assert_equal "Name", robot.name
    assert_equal "City", robot.city
    assert_equal "State", robot.state
    assert_equal "Birthdate", robot.birthdate
    assert_equal "Date Hired", robot.date_hired
    assert_equal "Department", robot.department
    assert_equal 1, robot.id
  end
end

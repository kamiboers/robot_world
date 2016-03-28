require_relative '../test_helper'

class UserCanCreateANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_creation_with_valid_attributes
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Example Robot'
    fill_in 'robot[city]', with: 'Example City'
    click_button 'Submit'

    assert_equal '/robots', current_path

    within '.robot' do
      assert page.has_content? 'Example Robot'
    end
  end
end

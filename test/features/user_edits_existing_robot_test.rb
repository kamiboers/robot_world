require_relative '../test_helper'

class UserCanEditAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_updated_with_new_information
    robot_manager.create({ title: 'Original Name',
                         description: 'Original State' })

    visit '/robots/1/edit'

    fill_in 'robot[title]', with: 'Updated Name'
    fill_in 'robot[description]', with: 'Updated State'
    click_button 'Submit'

    assert_equal '/robots/1', current_path

    within 'h2' do
      assert page.has_content? 'Updated Name'
    end

    within 'p' do
      assert page.has_content? 'Updated State'
    end
  end
end

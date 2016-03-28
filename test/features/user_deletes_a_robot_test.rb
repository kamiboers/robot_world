require_relative '../test_helper'

class UserCanDeleteAnExistingTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_deleted_successfully
    robot_manager.create({
      title: 'Original Name',
      description: 'Original State'
    })

    visit '/robots'
    assert page.has_content? 'Original Name'

    click_button 'delete'

    refute page.has_content? 'Original Name'
  end
end

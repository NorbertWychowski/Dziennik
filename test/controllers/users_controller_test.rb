require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get teacher_groups" do
    get users_teacher_groups_url
    assert_response :success
  end

end

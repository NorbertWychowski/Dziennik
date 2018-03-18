require 'test_helper'

class SeassionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seassions_new_url
    assert_response :success
  end

end

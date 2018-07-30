require 'test_helper'

class AssistantControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get assistant_main_url
    assert_response :success
  end

end

require 'test_helper'

class PayeesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get payees_main_url
    assert_response :success
  end

end

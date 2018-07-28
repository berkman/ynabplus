require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get categories_main_url
    assert_response :success
  end

end

require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  test "should get show_info" do
    get :show_info
    assert_response :success
  end

end

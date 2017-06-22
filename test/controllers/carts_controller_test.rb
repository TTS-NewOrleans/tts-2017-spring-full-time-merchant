require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get carts_edit_url
    assert_response :success
  end

end

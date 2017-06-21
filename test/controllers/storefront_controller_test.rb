require 'test_helper'

class StorefrontControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get storefront_index_url
    assert_response :success
  end

  test "should get about" do
    get storefront_about_url
    assert_response :success
  end

end

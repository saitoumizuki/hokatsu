require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get prices_new_url
    assert_response :success
  end

  test "should get edit" do
    get prices_edit_url
    assert_response :success
  end

end

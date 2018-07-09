require 'test_helper'

class NurseriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nurseries_index_url
    assert_response :success
  end

  test "should get show" do
    get nurseries_show_url
    assert_response :success
  end

  test "should get edit" do
    get nurseries_edit_url
    assert_response :success
  end

end

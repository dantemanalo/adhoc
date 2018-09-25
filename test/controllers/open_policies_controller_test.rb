require 'test_helper'

class OpenPoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get open_policies_index_url
    assert_response :success
  end

  test "should get show" do
    get open_policies_show_url
    assert_response :success
  end

end

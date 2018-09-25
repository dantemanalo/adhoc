require 'test_helper'

class RenewalListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @renewal_list = renewal_lists(:one)
  end

  test "should get index" do
    get renewal_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_renewal_list_url
    assert_response :success
  end

  test "should create renewal_list" do
    assert_difference('RenewalList.count') do
      post renewal_lists_url, params: { renewal_list: {  } }
    end

    assert_redirected_to renewal_list_url(RenewalList.last)
  end

  test "should show renewal_list" do
    get renewal_list_url(@renewal_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_renewal_list_url(@renewal_list)
    assert_response :success
  end

  test "should update renewal_list" do
    patch renewal_list_url(@renewal_list), params: { renewal_list: {  } }
    assert_redirected_to renewal_list_url(@renewal_list)
  end

  test "should destroy renewal_list" do
    assert_difference('RenewalList.count', -1) do
      delete renewal_list_url(@renewal_list)
    end

    assert_redirected_to renewal_lists_url
  end
end

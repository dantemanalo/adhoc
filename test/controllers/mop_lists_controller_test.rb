require 'test_helper'

class MopListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mop_list = mop_lists(:one)
  end

  test "should get index" do
    get mop_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_mop_list_url
    assert_response :success
  end

  test "should create mop_list" do
    assert_difference('MopList.count') do
      post mop_lists_url, params: { mop_list: {  } }
    end

    assert_redirected_to mop_list_url(MopList.last)
  end

  test "should show mop_list" do
    get mop_list_url(@mop_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_mop_list_url(@mop_list)
    assert_response :success
  end

  test "should update mop_list" do
    patch mop_list_url(@mop_list), params: { mop_list: {  } }
    assert_redirected_to mop_list_url(@mop_list)
  end

  test "should destroy mop_list" do
    assert_difference('MopList.count', -1) do
      delete mop_list_url(@mop_list)
    end

    assert_redirected_to mop_lists_url
  end
end

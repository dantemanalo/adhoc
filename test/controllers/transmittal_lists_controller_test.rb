require 'test_helper'

class TransmittalListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transmittal_list = transmittal_lists(:one)
  end

  test "should get index" do
    get transmittal_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_transmittal_list_url
    assert_response :success
  end

  test "should create transmittal_list" do
    assert_difference('TransmittalList.count') do
      post transmittal_lists_url, params: { transmittal_list: {  } }
    end

    assert_redirected_to transmittal_list_url(TransmittalList.last)
  end

  test "should show transmittal_list" do
    get transmittal_list_url(@transmittal_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_transmittal_list_url(@transmittal_list)
    assert_response :success
  end

  test "should update transmittal_list" do
    patch transmittal_list_url(@transmittal_list), params: { transmittal_list: {  } }
    assert_redirected_to transmittal_list_url(@transmittal_list)
  end

  test "should destroy transmittal_list" do
    assert_difference('TransmittalList.count', -1) do
      delete transmittal_list_url(@transmittal_list)
    end

    assert_redirected_to transmittal_lists_url
  end
end

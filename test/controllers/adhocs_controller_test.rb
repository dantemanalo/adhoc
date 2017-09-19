require 'test_helper'

class AdhocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adhoc = adhocs(:one)
  end

  test "should get index" do
    get adhocs_url
    assert_response :success
  end

  test "should get new" do
    get new_adhoc_url
    assert_response :success
  end

  test "should create adhoc" do
    assert_difference('Adhoc.count') do
      post adhocs_url, params: { adhoc: {  } }
    end

    assert_redirected_to adhoc_url(Adhoc.last)
  end

  test "should show adhoc" do
    get adhoc_url(@adhoc)
    assert_response :success
  end

  test "should get edit" do
    get edit_adhoc_url(@adhoc)
    assert_response :success
  end

  test "should update adhoc" do
    patch adhoc_url(@adhoc), params: { adhoc: {  } }
    assert_redirected_to adhoc_url(@adhoc)
  end

  test "should destroy adhoc" do
    assert_difference('Adhoc.count', -1) do
      delete adhoc_url(@adhoc)
    end

    assert_redirected_to adhocs_url
  end
end

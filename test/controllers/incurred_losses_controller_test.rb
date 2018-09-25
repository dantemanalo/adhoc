require 'test_helper'

class IncurredLossesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incurred_loss = incurred_losses(:one)
  end

  test "should get index" do
    get incurred_losses_url
    assert_response :success
  end

  test "should get new" do
    get new_incurred_loss_url
    assert_response :success
  end

  test "should create incurred_loss" do
    assert_difference('IncurredLoss.count') do
      post incurred_losses_url, params: { incurred_loss: {  } }
    end

    assert_redirected_to incurred_loss_url(IncurredLoss.last)
  end

  test "should show incurred_loss" do
    get incurred_loss_url(@incurred_loss)
    assert_response :success
  end

  test "should get edit" do
    get edit_incurred_loss_url(@incurred_loss)
    assert_response :success
  end

  test "should update incurred_loss" do
    patch incurred_loss_url(@incurred_loss), params: { incurred_loss: {  } }
    assert_redirected_to incurred_loss_url(@incurred_loss)
  end

  test "should destroy incurred_loss" do
    assert_difference('IncurredLoss.count', -1) do
      delete incurred_loss_url(@incurred_loss)
    end

    assert_redirected_to incurred_losses_url
  end
end

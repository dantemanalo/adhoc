require 'test_helper'

class PolicyTaxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policy_tax = policy_taxes(:one)
  end

  test "should get index" do
    get policy_taxes_url
    assert_response :success
  end

  test "should get new" do
    get new_policy_tax_url
    assert_response :success
  end

  test "should create policy_tax" do
    assert_difference('PolicyTax.count') do
      post policy_taxes_url, params: { policy_tax: {  } }
    end

    assert_redirected_to policy_tax_url(PolicyTax.last)
  end

  test "should show policy_tax" do
    get policy_tax_url(@policy_tax)
    assert_response :success
  end

  test "should get edit" do
    get edit_policy_tax_url(@policy_tax)
    assert_response :success
  end

  test "should update policy_tax" do
    patch policy_tax_url(@policy_tax), params: { policy_tax: {  } }
    assert_redirected_to policy_tax_url(@policy_tax)
  end

  test "should destroy policy_tax" do
    assert_difference('PolicyTax.count', -1) do
      delete policy_tax_url(@policy_tax)
    end

    assert_redirected_to policy_taxes_url
  end
end

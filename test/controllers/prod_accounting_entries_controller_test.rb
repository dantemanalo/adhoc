require 'test_helper'

class ProdAccountingEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prod_accounting_entry = prod_accounting_entries(:one)
  end

  test "should get index" do
    get prod_accounting_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_prod_accounting_entry_url
    assert_response :success
  end

  test "should create prod_accounting_entry" do
    assert_difference('ProdAccountingEntry.count') do
      post prod_accounting_entries_url, params: { prod_accounting_entry: {  } }
    end

    assert_redirected_to prod_accounting_entry_url(ProdAccountingEntry.last)
  end

  test "should show prod_accounting_entry" do
    get prod_accounting_entry_url(@prod_accounting_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_prod_accounting_entry_url(@prod_accounting_entry)
    assert_response :success
  end

  test "should update prod_accounting_entry" do
    patch prod_accounting_entry_url(@prod_accounting_entry), params: { prod_accounting_entry: {  } }
    assert_redirected_to prod_accounting_entry_url(@prod_accounting_entry)
  end

  test "should destroy prod_accounting_entry" do
    assert_difference('ProdAccountingEntry.count', -1) do
      delete prod_accounting_entry_url(@prod_accounting_entry)
    end

    assert_redirected_to prod_accounting_entries_url
  end
end

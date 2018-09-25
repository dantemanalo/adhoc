require 'test_helper'

class TopProducersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top_producer = top_producers(:one)
  end

  test "should get index" do
    get top_producers_url
    assert_response :success
  end

  test "should get new" do
    get new_top_producer_url
    assert_response :success
  end

  test "should create top_producer" do
    assert_difference('TopProducer.count') do
      post top_producers_url, params: { top_producer: {  } }
    end

    assert_redirected_to top_producer_url(TopProducer.last)
  end

  test "should show top_producer" do
    get top_producer_url(@top_producer)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_producer_url(@top_producer)
    assert_response :success
  end

  test "should update top_producer" do
    patch top_producer_url(@top_producer), params: { top_producer: {  } }
    assert_redirected_to top_producer_url(@top_producer)
  end

  test "should destroy top_producer" do
    assert_difference('TopProducer.count', -1) do
      delete top_producer_url(@top_producer)
    end

    assert_redirected_to top_producers_url
  end
end

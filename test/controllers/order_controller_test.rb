require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get lunch" do
    get :lunch
    assert_response :success
  end

  test "should get dinner" do
    get :dinner
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

  test "should get number_search" do
    get :number_search
    assert_response :success
  end

end

require 'test_helper'

class DevicecasesControllerTest < ActionController::TestCase
  setup do
    @devicecase = devicecases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devicecases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devicecase" do
    assert_difference('Devicecase.count') do
      post :create, devicecase: {  }
    end

    assert_redirected_to devicecase_path(assigns(:devicecase))
  end

  test "should show devicecase" do
    get :show, id: @devicecase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devicecase
    assert_response :success
  end

  test "should update devicecase" do
    patch :update, id: @devicecase, devicecase: {  }
    assert_redirected_to devicecase_path(assigns(:devicecase))
  end

  test "should destroy devicecase" do
    assert_difference('Devicecase.count', -1) do
      delete :destroy, id: @devicecase
    end

    assert_redirected_to devicecases_path
  end
end

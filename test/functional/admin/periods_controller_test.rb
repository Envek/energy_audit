require 'test_helper'

class Admin::PeriodsControllerTest < ActionController::TestCase
  setup do
    @admin_period = admin_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_period" do
    assert_difference('Admin::Period.count') do
      post :create, admin_period: @admin_period.attributes
    end

    assert_redirected_to admin_period_path(assigns(:admin_period))
  end

  test "should show admin_period" do
    get :show, id: @admin_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_period
    assert_response :success
  end

  test "should update admin_period" do
    put :update, id: @admin_period, admin_period: @admin_period.attributes
    assert_redirected_to admin_period_path(assigns(:admin_period))
  end

  test "should destroy admin_period" do
    assert_difference('Admin::Period.count', -1) do
      delete :destroy, id: @admin_period
    end

    assert_redirected_to admin_periods_path
  end
end

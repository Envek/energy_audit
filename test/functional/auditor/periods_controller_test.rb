require 'test_helper'

class Auditor::PeriodsControllerTest < ActionController::TestCase
  setup do
    @auditor_period = auditor_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auditor_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auditor_period" do
    assert_difference('Auditor::Period.count') do
      post :create, auditor_period: @auditor_period.attributes
    end

    assert_redirected_to auditor_period_path(assigns(:auditor_period))
  end

  test "should show auditor_period" do
    get :show, id: @auditor_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auditor_period
    assert_response :success
  end

  test "should update auditor_period" do
    put :update, id: @auditor_period, auditor_period: @auditor_period.attributes
    assert_redirected_to auditor_period_path(assigns(:auditor_period))
  end

  test "should destroy auditor_period" do
    assert_difference('Auditor::Period.count', -1) do
      delete :destroy, id: @auditor_period
    end

    assert_redirected_to auditor_periods_path
  end
end

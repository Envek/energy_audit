require 'test_helper'

class Admin::Users::OperatorsControllerTest < ActionController::TestCase
  setup do
    @admin_users_operator = admin_users_operators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users_operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_users_operator" do
    assert_difference('Admin::Users::Operator.count') do
      post :create, admin_users_operator: @admin_users_operator.attributes
    end

    assert_redirected_to admin_users_operator_path(assigns(:admin_users_operator))
  end

  test "should show admin_users_operator" do
    get :show, id: @admin_users_operator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_users_operator
    assert_response :success
  end

  test "should update admin_users_operator" do
    put :update, id: @admin_users_operator, admin_users_operator: @admin_users_operator.attributes
    assert_redirected_to admin_users_operator_path(assigns(:admin_users_operator))
  end

  test "should destroy admin_users_operator" do
    assert_difference('Admin::Users::Operator.count', -1) do
      delete :destroy, id: @admin_users_operator
    end

    assert_redirected_to admin_users_operators_path
  end
end

require 'test_helper'

class Admin::Users::AdminsControllerTest < ActionController::TestCase
  setup do
    @admin_users_admin = admin_users_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_users_admin" do
    assert_difference('Admin::Users::Admin.count') do
      post :create, admin_users_admin: @admin_users_admin.attributes
    end

    assert_redirected_to admin_users_admin_path(assigns(:admin_users_admin))
  end

  test "should show admin_users_admin" do
    get :show, id: @admin_users_admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_users_admin
    assert_response :success
  end

  test "should update admin_users_admin" do
    put :update, id: @admin_users_admin, admin_users_admin: @admin_users_admin.attributes
    assert_redirected_to admin_users_admin_path(assigns(:admin_users_admin))
  end

  test "should destroy admin_users_admin" do
    assert_difference('Admin::Users::Admin.count', -1) do
      delete :destroy, id: @admin_users_admin
    end

    assert_redirected_to admin_users_admins_path
  end
end

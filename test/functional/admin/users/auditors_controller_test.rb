require 'test_helper'

class Admin::Users::AuditorsControllerTest < ActionController::TestCase
  setup do
    @admin_users_auditor = admin_users_auditors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users_auditors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_users_auditor" do
    assert_difference('Admin::Users::Auditor.count') do
      post :create, admin_users_auditor: @admin_users_auditor.attributes
    end

    assert_redirected_to admin_users_auditor_path(assigns(:admin_users_auditor))
  end

  test "should show admin_users_auditor" do
    get :show, id: @admin_users_auditor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_users_auditor
    assert_response :success
  end

  test "should update admin_users_auditor" do
    put :update, id: @admin_users_auditor, admin_users_auditor: @admin_users_auditor.attributes
    assert_redirected_to admin_users_auditor_path(assigns(:admin_users_auditor))
  end

  test "should destroy admin_users_auditor" do
    assert_difference('Admin::Users::Auditor.count', -1) do
      delete :destroy, id: @admin_users_auditor
    end

    assert_redirected_to admin_users_auditors_path
  end
end

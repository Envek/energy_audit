require 'test_helper'

class Admin::Dictionaries::KindsControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_kind = admin_dictionaries_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_kind" do
    assert_difference('Admin::Dictionaries::Kind.count') do
      post :create, admin_dictionaries_kind: @admin_dictionaries_kind.attributes
    end

    assert_redirected_to admin_dictionaries_kind_path(assigns(:admin_dictionaries_kind))
  end

  test "should show admin_dictionaries_kind" do
    get :show, id: @admin_dictionaries_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_kind
    assert_response :success
  end

  test "should update admin_dictionaries_kind" do
    put :update, id: @admin_dictionaries_kind, admin_dictionaries_kind: @admin_dictionaries_kind.attributes
    assert_redirected_to admin_dictionaries_kind_path(assigns(:admin_dictionaries_kind))
  end

  test "should destroy admin_dictionaries_kind" do
    assert_difference('Admin::Dictionaries::Kind.count', -1) do
      delete :destroy, id: @admin_dictionaries_kind
    end

    assert_redirected_to admin_dictionaries_kinds_path
  end
end

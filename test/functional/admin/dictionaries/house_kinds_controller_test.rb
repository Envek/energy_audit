require 'test_helper'

class Admin::Dictionaries::HouseKindsControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_house_kind = admin_dictionaries_house_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_house_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_house_kind" do
    assert_difference('Admin::Dictionaries::HouseKind.count') do
      post :create, admin_dictionaries_house_kind: {  }
    end

    assert_redirected_to admin_dictionaries_house_kind_path(assigns(:admin_dictionaries_house_kind))
  end

  test "should show admin_dictionaries_house_kind" do
    get :show, id: @admin_dictionaries_house_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_house_kind
    assert_response :success
  end

  test "should update admin_dictionaries_house_kind" do
    put :update, id: @admin_dictionaries_house_kind, admin_dictionaries_house_kind: {  }
    assert_redirected_to admin_dictionaries_house_kind_path(assigns(:admin_dictionaries_house_kind))
  end

  test "should destroy admin_dictionaries_house_kind" do
    assert_difference('Admin::Dictionaries::HouseKind.count', -1) do
      delete :destroy, id: @admin_dictionaries_house_kind
    end

    assert_redirected_to admin_dictionaries_house_kinds_path
  end
end

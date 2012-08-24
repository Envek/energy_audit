require 'test_helper'

class Admin::Dictionaries::HouseTypesControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_house_type = admin_dictionaries_house_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_house_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_house_type" do
    assert_difference('Admin::Dictionaries::HouseType.count') do
      post :create, admin_dictionaries_house_type: {  }
    end

    assert_redirected_to admin_dictionaries_house_type_path(assigns(:admin_dictionaries_house_type))
  end

  test "should show admin_dictionaries_house_type" do
    get :show, id: @admin_dictionaries_house_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_house_type
    assert_response :success
  end

  test "should update admin_dictionaries_house_type" do
    put :update, id: @admin_dictionaries_house_type, admin_dictionaries_house_type: {  }
    assert_redirected_to admin_dictionaries_house_type_path(assigns(:admin_dictionaries_house_type))
  end

  test "should destroy admin_dictionaries_house_type" do
    assert_difference('Admin::Dictionaries::HouseType.count', -1) do
      delete :destroy, id: @admin_dictionaries_house_type
    end

    assert_redirected_to admin_dictionaries_house_types_path
  end
end

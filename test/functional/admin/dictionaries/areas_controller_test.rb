require 'test_helper'

class Admin::Dictionaries::AreasControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_area = admin_dictionaries_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_area" do
    assert_difference('Admin::Dictionaries::Area.count') do
      post :create, admin_dictionaries_area: @admin_dictionaries_area.attributes
    end

    assert_redirected_to admin_dictionaries_area_path(assigns(:admin_dictionaries_area))
  end

  test "should show admin_dictionaries_area" do
    get :show, id: @admin_dictionaries_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_area
    assert_response :success
  end

  test "should update admin_dictionaries_area" do
    put :update, id: @admin_dictionaries_area, admin_dictionaries_area: @admin_dictionaries_area.attributes
    assert_redirected_to admin_dictionaries_area_path(assigns(:admin_dictionaries_area))
  end

  test "should destroy admin_dictionaries_area" do
    assert_difference('Admin::Dictionaries::Area.count', -1) do
      delete :destroy, id: @admin_dictionaries_area
    end

    assert_redirected_to admin_dictionaries_areas_path
  end
end

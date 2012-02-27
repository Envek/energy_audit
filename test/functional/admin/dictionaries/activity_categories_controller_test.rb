require 'test_helper'

class Admin::Dictionaries::ActivityCategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_activity_category = admin_dictionaries_activity_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_activity_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_activity_category" do
    assert_difference('Admin::Dictionaries::ActivityCategory.count') do
      post :create, admin_dictionaries_activity_category: @admin_dictionaries_activity_category.attributes
    end

    assert_redirected_to admin_dictionaries_activity_category_path(assigns(:admin_dictionaries_activity_category))
  end

  test "should show admin_dictionaries_activity_category" do
    get :show, id: @admin_dictionaries_activity_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_activity_category
    assert_response :success
  end

  test "should update admin_dictionaries_activity_category" do
    put :update, id: @admin_dictionaries_activity_category, admin_dictionaries_activity_category: @admin_dictionaries_activity_category.attributes
    assert_redirected_to admin_dictionaries_activity_category_path(assigns(:admin_dictionaries_activity_category))
  end

  test "should destroy admin_dictionaries_activity_category" do
    assert_difference('Admin::Dictionaries::ActivityCategory.count', -1) do
      delete :destroy, id: @admin_dictionaries_activity_category
    end

    assert_redirected_to admin_dictionaries_activity_categories_path
  end
end

require 'test_helper'

class Admin::Dictionaries::ActivitiesControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_activity = admin_dictionaries_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_activity" do
    assert_difference('Admin::Dictionaries::Activity.count') do
      post :create, admin_dictionaries_activity: @admin_dictionaries_activity.attributes
    end

    assert_redirected_to admin_dictionaries_activity_path(assigns(:admin_dictionaries_activity))
  end

  test "should show admin_dictionaries_activity" do
    get :show, id: @admin_dictionaries_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_activity
    assert_response :success
  end

  test "should update admin_dictionaries_activity" do
    put :update, id: @admin_dictionaries_activity, admin_dictionaries_activity: @admin_dictionaries_activity.attributes
    assert_redirected_to admin_dictionaries_activity_path(assigns(:admin_dictionaries_activity))
  end

  test "should destroy admin_dictionaries_activity" do
    assert_difference('Admin::Dictionaries::Activity.count', -1) do
      delete :destroy, id: @admin_dictionaries_activity
    end

    assert_redirected_to admin_dictionaries_activities_path
  end
end

require 'test_helper'

class Admin::Dictionaries::ResourcesControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_resource = admin_dictionaries_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_resource" do
    assert_difference('Admin::Dictionaries::Resource.count') do
      post :create, admin_dictionaries_resource: @admin_dictionaries_resource.attributes
    end

    assert_redirected_to admin_dictionaries_resource_path(assigns(:admin_dictionaries_resource))
  end

  test "should show admin_dictionaries_resource" do
    get :show, id: @admin_dictionaries_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_resource
    assert_response :success
  end

  test "should update admin_dictionaries_resource" do
    put :update, id: @admin_dictionaries_resource, admin_dictionaries_resource: @admin_dictionaries_resource.attributes
    assert_redirected_to admin_dictionaries_resource_path(assigns(:admin_dictionaries_resource))
  end

  test "should destroy admin_dictionaries_resource" do
    assert_difference('Admin::Dictionaries::Resource.count', -1) do
      delete :destroy, id: @admin_dictionaries_resource
    end

    assert_redirected_to admin_dictionaries_resources_path
  end
end

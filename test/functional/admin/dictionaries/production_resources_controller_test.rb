require 'test_helper'

class Admin::Dictionaries::ProductionResourcesControllerTest < ActionController::TestCase
  setup do
    @admin_dictionaries_production_resource = admin_dictionaries_production_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_dictionaries_production_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_dictionaries_production_resource" do
    assert_difference('Admin::Dictionaries::ProductionResource.count') do
      post :create, admin_dictionaries_production_resource: {  }
    end

    assert_redirected_to admin_dictionaries_production_resource_path(assigns(:admin_dictionaries_production_resource))
  end

  test "should show admin_dictionaries_production_resource" do
    get :show, id: @admin_dictionaries_production_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_dictionaries_production_resource
    assert_response :success
  end

  test "should update admin_dictionaries_production_resource" do
    put :update, id: @admin_dictionaries_production_resource, admin_dictionaries_production_resource: {  }
    assert_redirected_to admin_dictionaries_production_resource_path(assigns(:admin_dictionaries_production_resource))
  end

  test "should destroy admin_dictionaries_production_resource" do
    assert_difference('Admin::Dictionaries::ProductionResource.count', -1) do
      delete :destroy, id: @admin_dictionaries_production_resource
    end

    assert_redirected_to admin_dictionaries_production_resources_path
  end
end

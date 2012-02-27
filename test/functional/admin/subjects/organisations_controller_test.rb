require 'test_helper'

class Admin::Subjects::OrganisationsControllerTest < ActionController::TestCase
  setup do
    @admin_subjects_organisation = admin_subjects_organisations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_subjects_organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_subjects_organisation" do
    assert_difference('Admin::Subjects::Organisation.count') do
      post :create, admin_subjects_organisation: @admin_subjects_organisation.attributes
    end

    assert_redirected_to admin_subjects_organisation_path(assigns(:admin_subjects_organisation))
  end

  test "should show admin_subjects_organisation" do
    get :show, id: @admin_subjects_organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_subjects_organisation
    assert_response :success
  end

  test "should update admin_subjects_organisation" do
    put :update, id: @admin_subjects_organisation, admin_subjects_organisation: @admin_subjects_organisation.attributes
    assert_redirected_to admin_subjects_organisation_path(assigns(:admin_subjects_organisation))
  end

  test "should destroy admin_subjects_organisation" do
    assert_difference('Admin::Subjects::Organisation.count', -1) do
      delete :destroy, id: @admin_subjects_organisation
    end

    assert_redirected_to admin_subjects_organisations_path
  end
end

require 'test_helper'

class Admin::Subjects::AuthoritiesControllerTest < ActionController::TestCase
  setup do
    @admin_subjects_authority = admin_subjects_authorities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_subjects_authorities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_subjects_authority" do
    assert_difference('Admin::Subjects::Authority.count') do
      post :create, admin_subjects_authority: @admin_subjects_authority.attributes
    end

    assert_redirected_to admin_subjects_authority_path(assigns(:admin_subjects_authority))
  end

  test "should show admin_subjects_authority" do
    get :show, id: @admin_subjects_authority
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_subjects_authority
    assert_response :success
  end

  test "should update admin_subjects_authority" do
    put :update, id: @admin_subjects_authority, admin_subjects_authority: @admin_subjects_authority.attributes
    assert_redirected_to admin_subjects_authority_path(assigns(:admin_subjects_authority))
  end

  test "should destroy admin_subjects_authority" do
    assert_difference('Admin::Subjects::Authority.count', -1) do
      delete :destroy, id: @admin_subjects_authority
    end

    assert_redirected_to admin_subjects_authorities_path
  end
end

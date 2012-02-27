require 'test_helper'

class Admin::Subjects::DistrictsControllerTest < ActionController::TestCase
  setup do
    @admin_subjects_district = admin_subjects_districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_subjects_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_subjects_district" do
    assert_difference('Admin::Subjects::District.count') do
      post :create, admin_subjects_district: @admin_subjects_district.attributes
    end

    assert_redirected_to admin_subjects_district_path(assigns(:admin_subjects_district))
  end

  test "should show admin_subjects_district" do
    get :show, id: @admin_subjects_district
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_subjects_district
    assert_response :success
  end

  test "should update admin_subjects_district" do
    put :update, id: @admin_subjects_district, admin_subjects_district: @admin_subjects_district.attributes
    assert_redirected_to admin_subjects_district_path(assigns(:admin_subjects_district))
  end

  test "should destroy admin_subjects_district" do
    assert_difference('Admin::Subjects::District.count', -1) do
      delete :destroy, id: @admin_subjects_district
    end

    assert_redirected_to admin_subjects_districts_path
  end
end

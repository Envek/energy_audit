require 'test_helper'

class Admin::Users::OperatorSubjectsControllerTest < ActionController::TestCase
  setup do
    @admin_users_operator_subject = admin_users_operator_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users_operator_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_users_operator_subject" do
    assert_difference('Admin::Users::OperatorSubject.count') do
      post :create, admin_users_operator_subject: @admin_users_operator_subject.attributes
    end

    assert_redirected_to admin_users_operator_subject_path(assigns(:admin_users_operator_subject))
  end

  test "should show admin_users_operator_subject" do
    get :show, id: @admin_users_operator_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_users_operator_subject
    assert_response :success
  end

  test "should update admin_users_operator_subject" do
    put :update, id: @admin_users_operator_subject, admin_users_operator_subject: @admin_users_operator_subject.attributes
    assert_redirected_to admin_users_operator_subject_path(assigns(:admin_users_operator_subject))
  end

  test "should destroy admin_users_operator_subject" do
    assert_difference('Admin::Users::OperatorSubject.count', -1) do
      delete :destroy, id: @admin_users_operator_subject
    end

    assert_redirected_to admin_users_operator_subjects_path
  end
end

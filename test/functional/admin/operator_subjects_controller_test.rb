require 'test_helper'

class Admin::OperatorSubjectsControllerTest < ActionController::TestCase
  setup do
    @admin_operator_subject = admin_operator_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_operator_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_operator_subject" do
    assert_difference('Admin::OperatorSubject.count') do
      post :create, admin_operator_subject: {  }
    end

    assert_redirected_to admin_operator_subject_path(assigns(:admin_operator_subject))
  end

  test "should show admin_operator_subject" do
    get :show, id: @admin_operator_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_operator_subject
    assert_response :success
  end

  test "should update admin_operator_subject" do
    put :update, id: @admin_operator_subject, admin_operator_subject: {  }
    assert_redirected_to admin_operator_subject_path(assigns(:admin_operator_subject))
  end

  test "should destroy admin_operator_subject" do
    assert_difference('Admin::OperatorSubject.count', -1) do
      delete :destroy, id: @admin_operator_subject
    end

    assert_redirected_to admin_operator_subjects_path
  end
end

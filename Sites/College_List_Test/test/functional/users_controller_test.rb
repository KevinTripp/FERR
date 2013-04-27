require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { allow_email: @user.allow_email, allow_text: @user.allow_text, birthdate: @user.birthdate, email: @user.email, first_name: @user.first_name, gpa: @user.gpa, last_name: @user.last_name, password: @user.password, phone: @user.phone, sat: @user.sat }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { allow_email: @user.allow_email, allow_text: @user.allow_text, birthdate: @user.birthdate, email: @user.email, first_name: @user.first_name, gpa: @user.gpa, last_name: @user.last_name, password: @user.password, phone: @user.phone, sat: @user.sat }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end

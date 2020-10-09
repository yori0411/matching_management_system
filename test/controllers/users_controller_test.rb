require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { authority: @user.authority, filename: @user.filename, gender: @user.gender, name: @user.name, password: @user.password, q10: @user.q10, q11: @user.q11, q12: @user.q12, q1: @user.q1, q2: @user.q2, q3: @user.q3, q4: @user.q4, q5: @user.q5, q6: @user.q6, q7: @user.q7, q8: @user.q8, q9: @user.q9, user_id: @user.user_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { authority: @user.authority, filename: @user.filename, gender: @user.gender, name: @user.name, password: @user.password, q10: @user.q10, q11: @user.q11, q12: @user.q12, q1: @user.q1, q2: @user.q2, q3: @user.q3, q4: @user.q4, q5: @user.q5, q6: @user.q6, q7: @user.q7, q8: @user.q8, q9: @user.q9, user_id: @user.user_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

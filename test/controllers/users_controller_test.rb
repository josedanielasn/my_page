require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username:'jose',email:'jose@yahoo.com',password:'josejose', admin:true)
    # byebug
    login_user(@user)
  end
  test "should get new" do
    get new_users_url
    assert_response :success
  end
  test "should get create" do
    post create_users_url, params:{user: {username:'rico',email:'rico@yahoo.com',password:'ricorico'}}
    assert_response :redirect
  end

  test "should get edit" do
    get edit_users_url(@user)
    assert_response :success
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test 'Should delete user' do
    user = User.find_by(username:@user.username)
    assert_difference "User.count", -1 do
      delete delete_users_path(user)
    end
  end

end

require 'test_helper'

class DeleteUserTest < ActionDispatch::IntegrationTest
  setup do
    User.delete_all
    @user = User.create(username:'jose',email:'jose@yahoo.com',password:'josejose', admin:true)
    # byebug
    login_user(@user)
  end
  test "Shoould got to user data page and delete user" do
    user = User.find_by(username:@user.username)
    get users_url(user)
    assert_response :success
    assert_difference "User.count", -1 do
      delete delete_users_path(user)
    end
    assert_redirected_to users_path
  end
end

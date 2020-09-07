require 'test_helper'

class EditUserTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username:'jose',email:'jose@yahoo.com',password:'josejose')
    # byebug
    login_user(@user)
  end
  test "should go to edit user form and update user information" do
    user = @user
    get users_url(user)
    assert_response :success, 'The page did not render'

      patch update_users_url(user),  params: {user:  {username:'DANIEL'}}
     assert_redirected_to users_path
     user.reload
    assert_equal "DANIEL", user.username
  end
end

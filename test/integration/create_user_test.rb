require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  test "should go to new user form and create user" do
    get new_users_url
    assert_response :success, 'The page did not render'
    assert_difference "User.count", 1 do
      post create_users_path params:{user: {username:'rico',email:'rico@yahoo.com',password:'ricorico'}}
      assert_response :redirect, "The user was not created"
    end
    follow_redirect!
    assert_response :success
  end
end

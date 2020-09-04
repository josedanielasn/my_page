require 'test_helper'

class UserTest < ActiveSupport::TestCase

    test "should not save if user has an empty email" do
      user = User.new
      user.username = "jose"
      user.password = "josejose"
      assert_not user.save, "Saved the user without  email"
    end

    test "should not save if user has an empty username" do
      user = User.new
      user.email = "jose@yahoo.com"
      user.password = "josejose"
      assert_not user.save, "Saved the user without username"
    end

    test "should not save if user has an empty password" do
      user = User.new
      user.email = "jose@yahoo.com"
      user.username = "jose"
      assert_not user.save, "Saved the user without password"
    end

    test "should save if both have email, username, and password" do
      user = User.new
      user.email = "jose@yahoo.com"
      user.username = "jose"
      user.password = "josejose"
      assert user.save, "Did not save with all the presence"
    end


    

end

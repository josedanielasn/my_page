require 'test_helper'

class UserTest < ActiveSupport::TestCase

    setup do
      @correct_user_format = User.new(username:"jose",email:"jose@yahoo.com", password:"josejose")
    end

# test for presence :true
    test "should not save if user has an empty email" do
      current_user = @correct_user_format.dup
      current_user.email = ""
      assert_not current_user.save, "Saved the user without  email"
    end

    test "should not save if user has an empty username" do
      current_user = @correct_user_format.dup
      current_user.username = ""
      assert_not current_user.save, "Saved the user without username"
    end

    test "should not save if user has an empty password" do
      current_user = @correct_user_format.dup
      current_user.password = nil
      assert_not current_user.save, "Saved the user without password"
    end

    test "should save if all parameters are present and valid" do
      current_user = @correct_user_format.dup
      assert current_user.save, "Did not save, even with all presence condition for each parameter is true"
    end


 # test for length Username
    test "should not save if username length < 3  " do
      current_user = @correct_user_format.dup
      current_user.username = 'jo'
      assert_not current_user.save, "Saved after not satisfiying username length < 3"
    end

    test "should not save if username length > 25" do
      current_user = @correct_user_format.dup
      current_user.username = 'j' * 26
      assert_not current_user.save, "Saved after not satisfiying username length < 25"
    end

 # test for length Email
    test "should not save if email length < 3  " do
      current_user = @correct_user_format.dup
      current_user.email = 'j@'
      assert_not current_user.save, "Saved after not satisfiying username length < 3"
    end

    test "should not save if email length > 125" do
      current_user = @correct_user_format.dup
      current_user.email = 'jose@yahoo.com' * 50
      assert_not current_user.save, "Saved after not satisfiying username length < 125"
    end
    

 # test for uniqueness 
    test "Username should be unique" do
      current_user = @correct_user_format.dup
      current_user.save
      clone =  User.new(username:"jose", email:"different@yahoo.com", password:"josejose")
      assert_not clone.save, "Saved after not satisfying uniqueness of username"
    end

    test "Email should be unique" do
      current_user = @correct_user_format.dup
      current_user.save
      clone = User.new(username:"different", email:"jose@yahoo.com", password:"josejose")
      assert_not clone.save, "Saved after not satisfying uniqueness of email"
    end

end

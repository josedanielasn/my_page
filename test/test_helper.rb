ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # def sign_in_user(user)
  #   post create_users_path, params: {username:user.username, email:user.email,password:'password'}
  # end

  def login_user(user)
    # byebug
    post login_path, params: {session:  {username:'jose',password:'josejose'} }
  end

end

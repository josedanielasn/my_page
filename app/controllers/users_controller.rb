class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:edit,:update]
  before_action :admin_user, only: [:delete]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
   if @user.save
    flash[:alert] = "User created."
    redirect_to users_path
   else
     render 'new'
   end
  end

  # def auth
  #   @user = User.find_by(username: params[:username])
  #   @result = @user.authenticate(params[:password])
  #   if @result
  #     redirect_to users_path
  #   else
  #     render 'login'
  #   end
  # end

  def login
    
  end

  def show
    @user = User.find(session[:user_id])
  end

  def index 
    current_user
    @user = User.all
    @inactive_users = @user.select do |user|
      user.id != session[:user_id]
    end
    # @checker = (session[:user_id] == @user.id)
  end

  def  edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(params_user)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find_by(params[:id])
    @user.destroy
    log_out
    redirect_to users_path
  end

  private
  def params_user
    params.require(:user).permit(:username, :email, :password)
  end
end

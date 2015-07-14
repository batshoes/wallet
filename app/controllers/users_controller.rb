class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new  
    @user = User.new
  end

  def create
    @user = User.create (user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def show
    @user = User.find params[:id]
  end

 private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:username, :password, :email, :fname, :lname, :phone, :balance)
  end



end

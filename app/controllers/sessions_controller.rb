class SessionsController < ApplicationController
 def create
    username = params[:username]
    password = params[:password]

    @user = User.where(username: username).first
    
    if @user.nil?
      #wrong username case
      flash[:alert] = "Incorrect Credentials"
      redirect_to root_path
    else #success username case
      if @user.password == password
        session[:user_id] = @user.id
        flash[:alert] = "Welcome Cheese noodle"
        redirect_to root_path
      else  
        flash[:alert] = "Incorrect Credentials"
        redirect_to root_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Successful Logout"
    redirect_to root_path
  end
end

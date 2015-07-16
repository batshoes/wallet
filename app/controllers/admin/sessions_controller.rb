class Admin::SessionsController < ApplicationController
  def new
    
  end

  def create
    @admin = Admin.find_by_username( params[:username])
      if @admin.present?
        if @admin.password == params[:password]
          session[:admin_id] = @admin.id
          redirect_to admin_cards_path
          flash[:alert] = "Howdy Homie"
        else 
          flash[:alert] = "Wrong Password"
          redirect_to new_admin_session_path
        end
      else
        flash[:alert] = "No Admin with that Username"
      end
  end

  def destroy
    session[:admin_id] = nil
    flash[:alert] = "Successful Logout"
    redirect_to root_path
  end
end
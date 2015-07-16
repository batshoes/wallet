class Admin::CardsController <ApplicationController
layout :admin_layout
before_action :verify_admin

  def index
    @cards = Card.all
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to admin_cards_path
  end

  def verify_admin
    redirect_to root_path unless current_admin
  end


private

  def admin_layout
    if current_admin
    'admin.html.erb'
    else
    'application.html.erb'      
    end
  end
end
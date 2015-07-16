class CardsController < ApplicationController
  
  def index
    if params[:user_id].present?
      @user = User.find params[:user_id]
      @cards = @user.cards
    else
      @cards = Card.all
    end
  end

  def create
    @card = Card.new(card_params)
    @card.users << current_user
    @card.save
    redirect_to cards_path
  end

  def new 
    @card = Card.new
  end


  def edit  
    @card = Card.find params[:id]
  end

  def show
    @user = User.find params[:id]
    @card = @user.cards
  end

  def update
    @card = Card.find params[:id]
    @card.update card_params
    flash[:notice] = "Successful Update"
    redirect_to card_path(@card.id)
  end

  def destroy
    @card = Card.find params[:id]
    @card.destroy!
    flash[:notice] = "Card Deleted"
    redirect_to cards_path
  end
   private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def card_params
    params.require(:card).permit(:cc, :xmonth, :xyear, :expiration_date)
  end
end

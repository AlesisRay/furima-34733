class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @furima = Furima.new
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
   def furima_params
    params.require(:furima).permit(:image, :title, :price, :text, :category_id, :item_status_id, :shipping_charges_id, :shipping_date_id, :prefecture_id).merge(user_id: current_user.id)
   end

end
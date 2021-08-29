class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @furima = Furima.all.order(created_at: :desc)
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
    unless user_signed_in? && current_user == @furima.user
      redirect_to root_path
    end
  end

  private
   def furima_params
    params.require(:furima).permit(:image, :title, :price, :info, :category_id, :item_status_id, :shipping_charge_id, :shipping_date_id, :prefecture_id).merge(user_id: current_user.id)
   end

end
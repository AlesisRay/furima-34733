class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_furima, only: [:show, :edit, :update]

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
  end

  def edit
    redirect_to root_path unless current_user == @furima.user && @furima.purchase.blank?
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path(@furima)
    else
      render :edit
    end
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy if current_user == furima.user
    redirect_to root_path
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :title, :price, :info, :category_id, :item_status_id, :shipping_charge_id,
                                   :shipping_date_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end
end

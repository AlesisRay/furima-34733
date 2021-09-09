class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @furima = Furima.find(params[:furima_id])
    @purchase_customer = PurchaseCustomer.new
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @purchase_customer = PurchaseCustomer.new(purchase_params)
    if @purchase_customer.valid?
      pay_item
      @purchase_customer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_customer).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building).merge(
      user_id: current_user.id, furima_id: @furima.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @furima.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

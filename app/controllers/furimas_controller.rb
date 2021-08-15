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

end

class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @baskets = Basket.all
    respond_with(@baskets)
  end

  def show
    respond_with(@basket)
  end

  def new
    @basket = Basket.new
    respond_with(@basket)
  end

  def edit
  end

  def create
    @basket = Basket.new(basket_params)
    @basket.save
    respond_with(@basket)
  end

  def update
    @basket.update(basket_params)
    respond_with(@basket)
  end

  def destroy
    @basket.destroy
    respond_with(@basket)
  end

  private
    def set_basket
      @basket = Basket.find(params[:id])
    end

    def basket_params
      params.require(:basket).permit(:notice, :amount, :document)
    end
end

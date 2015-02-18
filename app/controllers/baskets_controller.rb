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
    1.times { @basket.items.build}
    respond_with(@basket, @item)
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
      params.require(:basket).permit(:notice, :amount, :document, :user_id, :payment_id, :vendor_id, items_attributes: [:name, :price, :quantity, :category, :_destroy])
    end
end

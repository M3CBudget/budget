class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @baskets = Basket.where(:user_id => current_user.id)
    respond_with(@baskets)
  end

  def show
    respond_with(@basket)
  end

  def new
    @basket = Basket.new
    @basket.items.build
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
      params.require(:basket).permit(:notice, :amount, :document, :user_id, :payment_id, :vendor_id, :purchase_date, items_attributes: [:id, :name, :price, :quantity, :notice, :category_id, :launch, :income, :user_id, :_destroy])
    end
end

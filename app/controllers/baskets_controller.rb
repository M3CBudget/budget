class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @baskets = Basket.where(:user_id => current_user.id)

    year = Time.now.year
    @chartBaskets = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September','Oktober', 'November', 'Dezember']
      f.series(:type=> 'column',:name=> 'Ausgaben',  :showInLegend => false, :data=> [ sum_amount(find_basket_for_time_period("01-01-#{year}","01-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("02-01-#{year}","02-28-#{year}")),
                                                             sum_amount(find_basket_for_time_period("03-01-#{year}","03-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("04-01-#{year}","04-30-#{year}")),
                                                             sum_amount(find_basket_for_time_period("05-01-#{year}","05-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("06-01-#{year}","06-30-#{year}")),
                                                             sum_amount(find_basket_for_time_period("07-01-#{year}","07-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("08-01-#{year}","08-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("09-01-#{year}","09-30-#{year}")),
                                                             sum_amount(find_basket_for_time_period("10-01-#{year}","10-31-#{year}")),
                                                             sum_amount(find_basket_for_time_period("11-01-#{year}","11-30-#{year}")),
                                                             sum_amount(find_basket_for_time_period("12-01-#{year}","12-31-#{year}")),])
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
    end

    respond_with(@baskets)
  end

  def show
    respond_with(@basket)
  end

  def new
    @basket = Basket.new
    @basket.items.build
    @categorys =  Category.where(:income => false, :user_id => current_user.id, :active => true)
    respond_with(@basket, @item, @categorys)
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

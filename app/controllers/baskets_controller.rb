class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @baskets = Basket.where(:user_id => current_user.id)

    year = Time.now.year
    @chartBaskets = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September','Oktober', 'November', 'Dezember']
      f.series(:type=> 'column',:name=> 'Ausgaben',:data=> [ sum_amount(find_basket_for_time_period("01-01-#{year}","31-01-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-02-#{year}","28-02-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-03-#{year}","31-03-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-04-#{year}","30-04-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-05-#{year}","31-05-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-06-#{year}","30-06-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-07-#{year}","31-07-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-08-#{year}","31-08-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-09-#{year}","30-09-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-10-#{year}","31-10-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-11-#{year}","30-11-#{year}")),
                                                             sum_amount(find_basket_for_time_period("01-12-#{year}","31-12-#{year}")),])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67])
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

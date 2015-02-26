class IncomeController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @incomes = Item.where(:user_id => current_user.id, :income => true)

    year = Time.now.year
    @chartIncomes = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September','Oktober', 'November', 'Dezember']
      f.series(:type=> 'column',:name=> 'Einnahmen',:data=> [ sum_price(find_incomes_for_time_period("01-01-#{year}","01-31-#{year}")),
                                                              sum_price(find_incomes_for_time_period("02-01-#{year}","02-28-#{year}")),
                                                              sum_price(find_incomes_for_time_period("03-01-#{year}","03-31-#{year}")),
                                                              sum_price(find_incomes_for_time_period("04-01-#{year}","04-30-#{year}")),
                                                              sum_price(find_incomes_for_time_period("05-01-#{year}","05-30-#{year}")),
                                                              sum_price(find_incomes_for_time_period("06-01-#{year}","06-30-#{year}")),
                                                              sum_price(find_incomes_for_time_period("07-01-#{year}","07-31-#{year}")),
                                                              sum_price(find_incomes_for_time_period("08-01-#{year}","08-31-#{year}")),
                                                              sum_price(find_incomes_for_time_period("09-01-#{year}","09-30-#{year}")),
                                                              sum_price(find_incomes_for_time_period("10-01-#{year}","10-31-#{year}")),
                                                              sum_price(find_incomes_for_time_period("11-01-#{year}","11-30-#{year}")),
                                                              sum_price(find_incomes_for_time_period("12-01-#{year}","12-31-#{year}")),])
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
    end
    respond_with(@incomes)
  end

  def show
    respond_with(@income)
  end

  def new
    @income = Item.new
    respond_with(@income)
  end

  def edit
  end

  def create
    @income = Item.new(income_params)
    @income.save
    respond_with(@income)
  end

  def update
    @income.update(income_params)
    respond_with(@income)
  end

  def destroy
    @income.destroy
    respond_with(@income)
  end

  private
  def set_income
    @income = Item.find(params[:id])
  end

  def income_params
    params.require(:item).permit( :category_id, :article_id, :user_id, :name, :quantity, :price, :notice, :income, :launch, :finish, :period_id)
  end
end
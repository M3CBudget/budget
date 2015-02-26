class IncomeController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @incomes = Item.where(:user_id => current_user.id, :income => true)

    year = Time.now.year
    @chartIncomes = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September','Oktober', 'November', 'Dezember']
      f.series(:type=> 'column',:name=> 'Einnahmen',:data=> [ sum_price(find_incomes_for_time_period("01-01-#{year}","31-01-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-02-#{year}","28-02-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-03-#{year}","31-03-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-04-#{year}","30-04-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-05-#{year}","31-05-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-06-#{year}","30-06-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-07-#{year}","31-07-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-08-#{year}","31-08-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-09-#{year}","30-09-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-10-#{year}","31-10-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-11-#{year}","30-11-#{year}")),
                                                              sum_price(find_incomes_for_time_period("01-12-#{year}","31-12-#{year}")),])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67])
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
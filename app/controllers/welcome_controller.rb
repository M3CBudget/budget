class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).order(:purchase_date).last(5)
    @lastIncomes = Item.where(:user_id => current_user.id, :income => true).last(5)

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Ausgaben', :data=> [ sum_amount(find_baskets_for_month).to_i ] )
      f.series(:name=>'Einnahmen', :data=> [ sum_price(find_incomes_for_month).to_i ] )
         f.options[:chart][:defaultSeriesType] = "column"
    end

   # Datenaufbereitung für das chartGraph Chart (letzten 5 Baskets)
    tmp = []
    trend = []
    @lastBaskets.each do |t|
      tmp << t.amount.to_f
    # trend << (tmp + t.amount.to_f) klappt nicht :(
    end

    @chartGraph = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = (Basket.where(:user_id => current_user.id).pluck(:purchase_date).last(5))
      f.series(:type=> 'column',:name=> 'Ausgaben',:data=>   tmp)
      f.series(:type=> 'spline',:name=> 'Trend', :data=> trend)
    end

    year = Time.now.year
    @chartYear = LazyHighCharts::HighChart.new('graph') do |f|
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

    respond_with(@lastBaskets, @lastCategories, @chart, @chartGraph, @chartYear)
  end
end
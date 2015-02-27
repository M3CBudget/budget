class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).order(:purchase_date).last(5)
    @lastIncomes = Item.where(:user_id => current_user.id, :income => true).last(5)

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Ausgaben', :showInLegend => false, :data=> [ sum_amount(find_baskets_for_month).to_i ] )
      f.series(:name=>'Einnahmen', :showInLegend => false, :data=> [ sum_price(find_incomes_for_month).to_i ] )
      f.options[:xAxis][:categories] =[Time.now.strftime("%B")]
      f.options[:chart][:defaultSeriesType] = "column"
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
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
      f.series(:type=> 'column',:name=> 'Ausgaben',  :showInLegend => false,:data=>   tmp)
      f.series(:type=> 'spline',:name=> 'Trend', :showInLegend => false, :data=> trend)
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
    end


    year = Time.now.year
    @chartYear = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September','Oktober', 'November', 'Dezember']
      f.series(:type=> 'column',:name=> 'Ausgaben', :showInLegend => false, :data=> [ sum_amount(find_basket_for_time_period("01-01-#{year}","01-31-#{year}")),
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
      f.series(:type=> 'column',:name=> 'Einnahmen',  :showInLegend => false, :data=> [ sum_price(find_incomes_for_time_period("01-01-#{year}","01-31-#{year}")),
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

    respond_with(@lastBaskets, @chart, @chartGraph, @chartYear)
  end
end
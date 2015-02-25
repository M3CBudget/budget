class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).last(5)
    @lastIncomes = Item.where(:user_id => current_user.id, :income => true).last(5)

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Einnahmen', :data=> [ sum_price(find_incomes_for_month).to_i ] )
      f.series(:name=>'Ausgaben', :data=> [ sum_amount(find_baskets_for_month).to_i ] )
      f.options[:chart][:defaultSeriesType] = "column"
    end



    @chartGraph = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = Basket.where(:user_id => current_user.id).pluck(:purchase_date).last(5)
      f.series(:type=> 'column',:name=> 'Ausgaben',:data=>  Basket.where(:user_id => current_user.id).pluck(:amount).last(5))
      f.series(:type=> 'spline',:name=> 'Average', :data=> [1])
    end

    respond_with(@lastBaskets, @lastCategories, @chart, @chartGraph)
  end
end
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
      f.plot_options({:column=>{:stacking=>"normal"}})
    end



    @chartGraph = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      f.series(:type=> 'column',:name=> 'Einnahmen',:data=> [3, 2, 1, 3, 4])
      f.series(:type=> 'column',:name=> 'Ausgaben',:data=> [2, 3, 5, 7, 6])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
    end

    respond_with(@lastBaskets, @lastCategories, @chart, @chartGraph)
  end
end
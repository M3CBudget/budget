class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).last(5)
    @lastCategories = Category.where(:user_id => current_user.id).last(5)

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Einnahmen', :data=> [ sum_price(find_incomes_of_user).to_i ] )
      f.series(:name=>'Ausgaben', :data=> [ sum_amount(find_baskets_of_user).to_i ] )
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end

    respond_with(@lastBaskets, @lastCategories, @chart)
  end
end
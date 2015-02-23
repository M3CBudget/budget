class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).last(5)
    @lastCategories = Category.where(:user_id => current_user.id).last(5)

    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
      f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
    end

    respond_with(@lastBaskets, @lastCategories, @h)
  end
end
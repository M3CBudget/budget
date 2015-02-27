class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @categories = Category.where(:user_id => current_user.id).order(active: :desc, income: :desc)
    category_name = []
    category_amount = []
    @categories.each do |c|
      category_name << c.name
      category_amount << (sum_price(find_income_items_of_category(c.id)) + sum_price(find_items_of_category(c.id)))
    end

    @chartCategories = LazyHighCharts::HighChart.new('bar') do |f|
      f.series(:name=> 'Betrag', :showInLegend => false, :data=> category_amount)
      f.options[:chart][:defaultSeriesType] = "bar"
      f.options[:xAxis] = {:plot_bands => "none", :title=>{:text=>"Kategorien"}, :categories => category_name}
      f.options[:yAxis][:title] = {:text=>"Euro"}
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
    end

    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :notice, :active, :income, :user_id, :glyphicon_id)
    end
end

class IncomeController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @incomes = Item.where(:user_id => current_user.id, :income => true)
    respond_with(@incomess)
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
    params.require(:item).permit( :category_id, :article_id, :user_id, :name, :quantity, :price, :notice, :income, :period, :launch, :finish)
  end
end
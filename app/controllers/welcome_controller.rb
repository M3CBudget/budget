class WelcomeController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  def index
    @lastBaskets = Basket.where(:user_id => current_user.id).last(5)
    @lastCategories = Category.where(:user_id => current_user.id).last(5)
    respond_with(@lastBaskets, @lastCategories )
  end
end
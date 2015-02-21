class WelcomeController < ApplicationController
  respond_to :html

  def index
    @lastBaskets = Basket.last(5)
    @lastCategories = Category.last(5)
    respond_with(@lastBaskets, @lastCategories )
  end
end
class WelcomeController < ApplicationController

    respond_to :html

  def index
    @lastBaskets = Basket.last(5)
    #@sumOfAmount = @lastBaskets.sum(:amount)
    respond_with(@lastBaskets, @sumOfAmount )
  end
end
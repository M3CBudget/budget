class PassthroughController < ApplicationController
  def index
    if current_user.present?
      path = welcome_index_path
    else
      path = landing_index_path
    end
    redirect_to path
  end
end

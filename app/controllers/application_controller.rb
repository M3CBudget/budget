class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :show_vendor_name, :show_category_name, :find_items_of_basket, :show_payment_name

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :first_name, :last_name) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :first_name, :last_name) }
  end

  def show_vendor_name(vendor_id)
    Vendor.find(vendor_id).name
  end

  def show_category_name(category_id)
    Category.find(category_id).name
  end

  def show_payment_name(payment_id)
    Payment.find(payment_id).name
  end

  def find_items_of_basket(basket_id)
    Item.where(:basket_id => basket_id)
  end
end

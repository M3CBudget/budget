class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :sum_amount, :show_vendor_name, :show_category_name, :find_items_of_basket, :show_payment_name, :find_items_of_category
  helper_method :find_baskets_of_vendor
  helper_method :find_baskets_of_payment

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :first_name, :last_name) }
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
    Item.where(:basket_id => basket_id, :user_id => current_user.id)
  end

  def find_items_of_category(category_id)
    Item.where(:category_id => category_id, :user_id => current_user.id)
  end

  def find_baskets_of_vendor(vendor_id)
    Basket.where(:vendor_id => vendor_id, :user_id => current_user.id)
  end

  def find_baskets_of_payment(payment_id)
    Basket.where(:payment_id => payment_id, :user_id => current_user.id)
  end

  def sum_amount(baskets)
    sum = 0
    baskets.each do |b|
      sum = sum + b.amount
    end
    return sum
  end

end

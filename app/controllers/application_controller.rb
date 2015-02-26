class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :sum_amount, :show_vendor_name, :show_category_name, :find_items_of_basket, :show_payment_name, :find_items_of_category
  helper_method :find_baskets_of_vendor
  helper_method :find_baskets_of_payment, :is_active, :sum_price, :find_baskets_of_user, :items_of_user
  helper_method :find_basket_for_time_period, :find_income_items_of_category, :find_baskets_for_month, :find_incomes_for_time_period, :find_incomes_for_month, :get_months_of_baskets

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
    Item.where(:category_id => category_id, :user_id => current_user.id, :income => false)
  end

  def find_income_items_of_category(category_id)
    Item.where(:category_id => category_id, :user_id => current_user.id, :income => true)
  end

  def find_items_of_category(category_id)
    Item.where(:category_id => category_id, :user_id => current_user.id)
  end

  def find_baskets_of_vendor(vendor_id)
    Basket.where(:vendor_id => vendor_id, :user_id => current_user.id)
  end

  def find_basket_for_time_period(start_date, end_date)
    Basket.where(:user_id => current_user.id, :purchase_date => (start_date..end_date))
  end

  def find_incomes_for_time_period(start_date, end_date)
    Item.where(:user_id => current_user.id, :launch => (start_date..end_date), :income => true)
  end

  def find_incomes_for_month
    date = Time.now
    start_date = date.beginning_of_month
    return find_incomes_for_time_period(start_date, date)
  end

  def find_baskets_for_month
    date = Time.now
    start_date = date.beginning_of_month
    return find_basket_for_time_period(start_date, date)
  end

  def forecast_costs_for_month
    date = Date.now
    start_date = date.beginning_of_month
    sum = sum_amount(find_basket_for_time_period(start_date, date))
    dif = (date - start_date).to_i
    month = date.to_a[4]
    year = year.to_a[5]
    days_in_month = Time.days_in_month(month, year)
    cost_per_day = (sum / dif)
    costs_of_this_month = (sum + cost_per_day * (days_in_month - dif))
    return costs_of_this_month
  end

  def find_baskets_of_payment(payment_id)
    Basket.where(:payment_id => payment_id, :user_id => current_user.id)
  end

  def find_baskets_of_user
    Basket.where(:user_id => current_user.id)
  end

  def find_incomes_of_user
    Item.where(:user_id => current_user.id, :income => true)
  end

  def get_months_of_baskets(baskets)
    months = []
    baskets.each do |b|
        months.insert(b.purchase_date.month)
    end
    months.uniq!
    return months
  end

  def sum_amount(baskets)
    sum = 0
    if !baskets.nil?
      baskets.each do |b|
        sum = sum + b.amount
      end
    end
    return sum.to_f
  end

  def sum_price(items)
    sum = 0.0
    if !items.nil?
      items.each do |b|
        if !b.quantity.nil?
              sum = sum + (b.price * b.quantity)
        else
            sum = sum + b.price
        end
       end
    end
    return sum.to_f
  end

  def is_active(id)
      fin = Item.find(id).finish
      if fin.nil?
        active = true
      elsif fin.to_s < Time.now.to_s
      active = false
    else
      active = true
    end
    return active
  end



end

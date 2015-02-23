module VendorsHelper
  def find_baskets_in_month(vendor_id)
    Basket.where(:user_id => current_user.id, :vendor_id => vendor_id )
  end
end

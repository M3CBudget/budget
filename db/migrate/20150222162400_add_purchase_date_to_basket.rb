class AddPurchaseDateToBasket < ActiveRecord::Migration
  def change
    add_column :baskets, :purchase_date, :date
  end
end

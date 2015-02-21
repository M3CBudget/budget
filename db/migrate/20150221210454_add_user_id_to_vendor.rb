class AddUserIdToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :user, index: true
  end
end

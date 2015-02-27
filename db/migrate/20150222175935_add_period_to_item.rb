class AddPeriodToItem < ActiveRecord::Migration
  def change
    add_reference :items, :period, index: true
  end
end

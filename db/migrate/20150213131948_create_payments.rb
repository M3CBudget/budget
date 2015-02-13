class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.boolean :active
      t.references :account, index: true

      t.timestamps
    end
  end
end

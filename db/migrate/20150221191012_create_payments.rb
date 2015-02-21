class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true
      t.string :number
      t.string :bic
      t.boolean :active
      t.string :name

      t.timestamps
    end
  end
end

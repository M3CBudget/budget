class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :bic
      t.string :name
      t.boolean :active
      t.references :user, index: true

      t.timestamps
    end
  end
end

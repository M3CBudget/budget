class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :basket, index: true
      t.references :category, index: true
      t.references :article, index: true
      t.references :user, index: true
      t.string :name
      t.decimal :quantity
      t.decimal :price
      t.string :notice
      t.boolean :income
      t.integer :period
      t.date :launch
      t.date :finish

      t.timestamps
    end
  end
end

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price
      t.boolean :active
      t.references :category, index: true

      t.timestamps
    end
  end
end

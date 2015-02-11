class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :standard_price
      t.string :active_boolean

      t.timestamps
    end
  end
end

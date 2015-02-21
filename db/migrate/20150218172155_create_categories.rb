class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :notice
      t.boolean :active
      t.boolean :income
      t.timestamps
    end
  end
end

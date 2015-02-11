class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :notice
      t.decimal :amount
      t.binary :document

      t.timestamps
    end
  end
end

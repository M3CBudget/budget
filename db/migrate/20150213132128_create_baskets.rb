class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :notice
      t.decimal :amount
      t.binary :document
      t.references :user, index: true
      t.references :payment, index: true
      t.references :vendor, index: true

      t.timestamps
    end
  end
end

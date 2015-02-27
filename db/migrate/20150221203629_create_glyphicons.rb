class CreateGlyphicons < ActiveRecord::Migration
  def change
    create_table :glyphicons do |t|
      t.string :name

      t.timestamps
    end
  end
end

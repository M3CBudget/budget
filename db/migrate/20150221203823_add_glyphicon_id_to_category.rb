class AddGlyphiconIdToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :glyphicon, index: true
  end
end

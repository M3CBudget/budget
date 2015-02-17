class Article < ActiveRecord::Base
  belongs_to :category
  has_many :items
  validates :name, :price, :active
end

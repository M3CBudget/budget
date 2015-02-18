class Article < ActiveRecord::Base
  belongs_to :category
  has_many :items
  validates :name, :price, :active, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end

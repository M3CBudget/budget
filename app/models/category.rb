class Category < ActiveRecord::Base
  has_many :items
  validates :name, :active
end

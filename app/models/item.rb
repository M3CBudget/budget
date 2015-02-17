class Item < ActiveRecord::Base
  belongs_to :basket
  belongs_to :category
  belongs_to :article
  belongs_to :user
  validates :basket_id, :category_id, :article_id, :user_id, :name, :Quantity, :notice, :income, :period, :launch, :finish
end

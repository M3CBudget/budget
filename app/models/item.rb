class Item < ActiveRecord::Base
  belongs_to :basket
  belongs_to :category
  belongs_to :article
  belongs_to :user
  validates :name, presence: true
  validates :category_id, :user_id, :price,  presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end

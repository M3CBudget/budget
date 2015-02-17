class Item < ActiveRecord::Base
  belongs_to :basket
  belongs_to :category
  belongs_to :article
  belongs_to :user
end

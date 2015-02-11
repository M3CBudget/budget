class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
  has_many :items

end

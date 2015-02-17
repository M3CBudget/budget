class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :vendor
  has_many :items
  validates :notice, :amount, :user_id, :payment_id, :vendor_id
end

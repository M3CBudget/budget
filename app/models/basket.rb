class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :vendor
  has_many :items
  accepts_nested_attributes_for :items
  validates :notice, :amount, :user_id, :payment_id, :vendor_id
end

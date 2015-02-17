class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :vendor
  has_many :items
  accepts_nested_attributes_for :items
  validates :amount, :user_id, :vendor_id, presence: true
end

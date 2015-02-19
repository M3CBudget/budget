class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :vendor
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
  validates :amount, :user_id, :vendor_id, presence: true
  validates :amount, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end

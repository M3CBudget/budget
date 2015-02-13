class Basket < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  belongs_to :vendor
end

class Vendor < ActiveRecord::Base
  has_many :baskets
  validates :name
end

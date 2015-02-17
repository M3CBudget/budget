class Payment < ActiveRecord::Base
  belongs_to :account
  belongs_to :basket
  validates :account_id, :name, :active
end

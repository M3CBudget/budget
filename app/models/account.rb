class Account < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  validates :number, :bic, :name, :active, :user_id

end

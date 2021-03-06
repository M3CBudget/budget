class Account < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  validates :number, :bic, :name, :user_id, presence: true

end

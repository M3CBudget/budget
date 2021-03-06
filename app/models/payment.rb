class Payment < ActiveRecord::Base
  belongs_to :user
  has_many :basket
  validates :name, :bic, :number, :user_id, presence: true
end

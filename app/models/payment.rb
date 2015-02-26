class Payment < ActiveRecord::Base
  belongs_to :user
  has_many :basket
  validates :name, :bic, :number, presence: true
end

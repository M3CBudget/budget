class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :basket
  validates :name, :active, :bic, :number, presence: true
end

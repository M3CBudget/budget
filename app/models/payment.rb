class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :basket
  validates :name, :bic, :number, presence: true
end

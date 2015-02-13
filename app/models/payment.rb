class Payment < ActiveRecord::Base
  belongs_to :account
  belongs_to :basket
end

class Category < ActiveRecord::Base
  belongs_to :user
  belongs_to :glyphicon
  validates :name, :user_id, presence: true
end

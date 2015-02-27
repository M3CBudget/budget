class Vendor < ActiveRecord::Base
  has_many :baskets
  belongs_to :user
  validates :name, :user_id, presence: true


  mount_uploader :logo, DocumentUploader


end

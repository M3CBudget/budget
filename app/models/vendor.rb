class Vendor < ActiveRecord::Base
  has_many :baskets
  belongs_to :user
  validates :name, presence: true


  mount_uploader :logo, DocumentUploader


end

class User < ActiveRecord::Base
  has_many :baskets
  has_many :payments
  has_many :items
  #attr_accessor :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'


end

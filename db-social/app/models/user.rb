class User < ActiveRecord::Base
  has_many :nices
  has_many :posts
  has_many :comments, through: :posts
  has_many :resources, through: :favorites

  validates :email, uniqueness: true
  validates :email, :password, :first_name, :last_name, presence: true
  validates_format_of :email, :with => /[\w|\.]+@\w+\.\w+/, :on => :create
  validates :password, length: { minimum: 6 }

  has_secure_password
end

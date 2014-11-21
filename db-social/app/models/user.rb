class User < ActiveRecord::Base
  has_many :nices
  has_many :posts
  has_many :comments, through: :posts
  has_many :favorites
  has_many :resources, through: :favorites

  validates :email, uniqueness: true
  validates :email, :password, :first_name, :last_name, presence: true, on: :update, allow_blank: true
  validates_format_of :email, :with => /[\w|\.]+@\w+\.\w+/, :on => :create
  validates :password, length: { minimum: 6 }, on: :update, allow_blank: true

  has_secure_password

  #attempt at changing route to first_name instead of id
  # def to_param
  #   self.first_name
  # end

end

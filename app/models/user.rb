class User < ActiveRecord::Base
  has_many :nices
  has_many :posts
  has_many :comments
  has_many :favorites
  has_many :resources, through: :favorites

  validates :email, uniqueness: true
  validates :email, :first_name, :last_name, presence: true
  validates_format_of :email, :with => /[\w|\.]+@\w+\.\w+/
  validates :password, :presence => true, :on => :update,
   :if => lambda{ !password.nil? }

  validates :password,
    :confirmation => true,
    :length => { :minimum => 6},
    :if => lambda{ new_record? || !password.nil? }

  validates :tweet_size_advice, :length => { :maximum => 140 }

  has_secure_password

end

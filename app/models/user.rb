class User < ActiveRecord::Base
  has_many :nices
  has_many :posts
  has_many :comments, through: :posts
  has_many :favorites
  has_many :resources, through: :favorites

  before_create { generate_token(:auth_token) }

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

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  has_secure_password

end

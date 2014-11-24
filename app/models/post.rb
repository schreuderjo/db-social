class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :nices

  validates :text, presence: true
  validates :text, length: { in: 1..141 }

  def duplicate?
    users_last_post = User.find(self.user_id).posts.last
    users_last_post.text == self.text
  end
end

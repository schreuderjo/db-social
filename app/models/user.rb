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

  def destroy_posts
    self.posts.each do |post|
      post.destroy
      nices = Nice.where(post_id: post.id)
      nices.each do |nice|
        nice.destroy
      end
      comments = Comment.where(post_id: post.id)
      comments.each do |comment|
        comment.destroy
      end
    end
  end

  def destroy_resources
    self.resources.each do |resource|
      unless resource.global_resource
        resource.destroy
      end
    end
  end

  def destroy_favorites
    self.favorites.each do |favorite|
      favorite.destroy
    end
  end


end

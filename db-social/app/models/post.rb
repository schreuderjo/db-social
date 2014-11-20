class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :nices

  validates :text, presence: true
  validates :text, length: { in: 1..141 }
end

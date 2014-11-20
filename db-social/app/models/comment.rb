class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :text, presence: true
  validates :text, length: { in: 1..141 }
end

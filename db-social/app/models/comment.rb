class Comment < ActiveRecord::Base
  belongs_to :post

  validates :text, presence: true
  validates :text, length: { in: 1..141 }
end

class Resource < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates_inclusion_of :global_resource, :in => [true, false]
  validates :name, :url, :description, :presence => {:message => "required field missing"}
  validates :description, length: {in: 1..140}
end

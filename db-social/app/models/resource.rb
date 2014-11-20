class Resource < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :global_resource, :inclusion => {:in => [true, false]}
  validates :name, :url, :description, :presence => {:message => "required field missing"}

end

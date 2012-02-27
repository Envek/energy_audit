class ActivityCategory < ActiveRecord::Base
  has_many :activities

  validates :name, :presence => true, :uniqueness => true

end

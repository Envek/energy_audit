class Area < ActiveRecord::Base
  has_many :measuring_devices

  validates :name, :presence => true, :uniqueness => true

end

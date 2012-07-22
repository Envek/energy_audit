class Kind < ActiveRecord::Base
  has_many :measuring_devices

  validates :name, :presence => true, :uniqueness => true

  default_scope order("id ASC")

end

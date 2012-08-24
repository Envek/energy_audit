class HouseType < ActiveRecord::Base

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:id)

end

class HouseType < ActiveRecord::Base
  has_many :house_numbers, :dependent => :destroy

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:id)

end

class HouseKind < ActiveRecord::Base
  has_many :house_kind_numbers, :dependent => :destroy
  has_many :house_numbers, :through => :house_kind_numbers

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:id)

end

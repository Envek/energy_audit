class Resource < ActiveRecord::Base
  has_many :consumptions, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

end

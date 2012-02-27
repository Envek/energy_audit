class Kind < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

end

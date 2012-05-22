class Activity < ActiveRecord::Base
  belongs_to :activity_category
  has_many :activity_values, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true

end

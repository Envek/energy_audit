class Activity < ActiveRecord::Base
  belongs_to :activity_category

  validates :name, :presence => true, :uniqueness => true

end

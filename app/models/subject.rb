class Subject < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  def to_label
    name
  end

end

class Subject < ActiveRecord::Base
  has_many :operator_subjects
  has_many :operators, :through => :operator_subjects
  has_many :measuring_devices
  has_many :audits

  validates :name, :presence => true, :uniqueness => true

  def to_label
    name
  end

end

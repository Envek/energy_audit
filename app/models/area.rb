class Area < ActiveRecord::Base
  has_many :measuring_devices

  validates :name, :presence => true, :uniqueness => true

  scope :with_measuring_devices, includes(:measuring_devices)
  scope :for_period_and_subject, lambda { |p, s| with_measuring_devices.where(:measuring_devices => {:period_id => p.id, :subject_id => s.id}) }
  default_scope order("areas.id ASC")

end

class MeasuringDevice < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :area
  belongs_to :kind

  validates :subject, :presence => true
  validates :period, :presence => true
  validates :area, :presence => true
  validates :kind, :presence => true

  validates :start_value, :numericality => { :only_integer => true}
  validates :planned_value, :numericality => { :only_integer => true}
  validates :final_value, :numericality => { :only_integer => true}

  scope :with_areas_and_kinds, includes(:area, :kind)
  scope :for_period_and_subject, lambda { |p, s| with_values.where(:period_id => p.id, :subject_id => s.id) }
  default_scope with_areas_and_kinds.order("area_id ASC, kind_id ASC")

  def equipment_level
    final_value*100.to_f/(start_value+planned_value)
  end

end

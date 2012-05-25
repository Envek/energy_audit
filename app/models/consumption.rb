class Consumption < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :resource

  validates :resource_id, :presence => true, :uniqueness => {:scope => [:period_id, :subject_id]}
  validates :period_id, :presence => true
  validates :subject_id, :presence => true

  scope :with_resource, includes(:resource)
  default_scope with_resource.order("resource_id ASC")

  # Replaces colon (,) to dot (.) in user input for decimal attributes
  def prev_cons_units=(value)
    self[:prev_cons_units] = value.to_s.strip.tr(',', '.')
  end

  def prev_cons_monetary=(value)
    self[:prev_cons_monetary] = value.to_s.strip.tr(',', '.')
  end

  def approved_year_cons_units=(value)
    self[:approved_year_cons_units] = value.to_s.strip.tr(',', '.')
  end

  def approved_year_cons_monetary=(value)
    self[:approved_year_cons_monetary] = value.to_s.strip.tr(',', '.')
  end

  def approved_period_cons_units=(value)
    self[:approved_period_cons_units] = value.to_s.strip.tr(',', '.')
  end

  def approved_period_cons_monetary=(value)
    self[:approved_period_cons_monetary] = value.to_s.strip.tr(',', '.')
  end

  def actual_cons_units=(value)
    self[:actual_cons_units] = value.to_s.strip.tr(',', '.')
  end

  def actual_cons_monetary=(value)
    self[:actual_cons_monetary] = value.to_s.strip.tr(',', '.')
  end

end

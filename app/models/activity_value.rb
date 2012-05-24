class ActivityValue < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :activity
  
  validates :activity_id, :presence => true, :uniqueness => {:scope => [:period_id, :subject_id]}
  validates :period_id, :presence => true
  validates :subject_id, :presence => true

  # Validates, that BigDecimals are looks as BigDecimals
  validates :planned_funding,     :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :actual_funding,      :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :total_financing,     :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :regional_financing,  :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :federal_financing,   :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :municipal_financing, :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :offbudget_financing, :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :natural_economy,     :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }
  validates :cost_economy,        :format => { :with => /\A[+-]?\d{0,24}(\.\d{0,8})?\Z/ }

  scope :with_categories, includes(:activity => :activity_category)

  # Replaces colon (,) to dot (.) in user input for decimal attributes
  def planned_funding=(value)
    self[:planned_funding] = value.to_s.strip.tr(',', '.')
  end

  def actual_funding=(value)
    self[:actual_funding] = value.to_s.strip.tr(',', '.')
  end

  def total_financing=(value)
    self[:total_financing] = value.to_s.strip.tr(',', '.')
  end

  def regional_financing=(value)
    self[:regional_financing] = value.to_s.strip.tr(',', '.')
  end

  def federal_financing=(value)
    self[:federal_financing] = value.to_s.strip.tr(',', '.')
  end

  def municipal_financing=(value)
    self[:municipal_financing] = value.to_s.strip.tr(',', '.')
  end

  def offbudget_financing=(value)
    self[:offbudget_financing] = value.to_s.strip.tr(',', '.')
  end

  def natural_economy=(value)
    self[:natural_economy] = value.to_s.strip.tr(',', '.')
  end

  def cost_economy=(value)
    self[:cost_economy] = value.to_s.strip.tr(',', '.')
  end

end

class Production < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject
  belongs_to :production_resource

  attr_accessible :production_resource_id, :consumption, :production, :useful_output

  validates :period_id, :presence => true
  validates :subject_id, :presence => true
  validates :production_resource_id, :presence => true, :uniqueness => { :scope => [:period_id, :subject_id] }
  validates :consumption,   :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :production,    :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :useful_output, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  scope :with_resource, includes(:production_resource)
  default_scope with_resource.order("production_resource_id ASC")

  # Replaces colon (,) to dot (.) in user input for decimal attributes
  def consumption=(value)
    self[:consumption] = value.to_s.strip.tr(',', '.')
  end

  def production=(value)
    self[:production] = value.to_s.strip.tr(',', '.')
  end

  def useful_output=(value)
    self[:useful_output] = value.to_s.strip.tr(',', '.')
  end

end

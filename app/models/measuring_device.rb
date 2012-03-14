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

end

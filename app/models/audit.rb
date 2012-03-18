class Audit < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject

  validates :subject_id, :presence => true, :uniqueness => {:scope => :period_id}
  validates :period_id, :presence => true, :uniqueness => {:scope => :subject_id}

  validates :buildings, :numericality => { :only_integer => true}
  validates :audited_before, :numericality => { :only_integer => true}
  validates :audit_required, :numericality => { :only_integer => true}
  validates :audited_in_period, :numericality => { :only_integer => true}
  validates :audit_contracts_before, :numericality => { :only_integer => true}
  validates :audit_contracts_after, :numericality => { :only_integer => true}

  attr_accessible :buildings, :audited_before, :audit_required, 
    :audited_in_period, :audit_contracts_before, :audit_contracts_after

  def audited_percentage
    self.audit_required.zero? ? nil : self.audited_in_period.to_f / self.audit_required * 100
  end

end

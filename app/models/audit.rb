class Audit < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject

  validates :subject, :presence => true, :uniqueness => {:scope => :period}
  validates :period, :presence => true, :uniqueness => {:scope => :subject}

  validates :buildings, :numericality => { :only_integer => true}
  validates :audited_before, :numericality => { :only_integer => true}
  validates :audit_required, :numericality => { :only_integer => true}
  validates :audited_in_period, :numericality => { :only_integer => true}
  validates :audit_contracts_before, :numericality => { :only_integer => true}
  validates :audit_contracts_after, :numericality => { :only_integer => true}

end

class Audit < ActiveRecord::Base
  belongs_to :period
  belongs_to :subject

  # Validations

  # Relations
  validates :subject_id, :presence => true, :uniqueness => { :scope => :period_id  }
  validates :period_id,  :presence => true, :uniqueness => { :scope => :subject_id }
  # Audit info
  validates :organizations,                :numericality => { :only_integer => true }
  validates :organizations_audit_required, :numericality => { :only_integer => true }
  validates :buildings,                    :numericality => { :only_integer => true }
  validates :organizations_before,         :numericality => { :only_integer => true }
  validates :buildings_before,             :numericality => { :only_integer => true }
  validates :organizations_audited,        :numericality => { :only_integer => true }
  validates :buildings_audited,            :numericality => { :only_integer => true }
  validates :contracts_count_before,       :numericality => { :only_integer => true }
  validates :contracts_count,              :numericality => { :only_integer => true }
  validates :contracts_volume,             :numericality => true
  # Custom validators
  validate :audit_constraints
  # Reference info
  validates :ref_orgs_with_programs_count,     :numericality => { :only_integer => true, :allow_blank => true }
  validates :ref_orgs_with_responsibles_count, :numericality => { :only_integer => true, :allow_blank => true }
  validates :ref_planning_economy_value,       :numericality => { :allow_blank => true }

  # A bit of security
  attr_accessible :organizations, :organizations_audit_required, :buildings,
    :organizations_before, :buildings_before, :organizations_audited,
    :buildings_audited, :contracts_count_before, :contracts_count,
    :contracts_volume, :ref_orgs_with_programs_count,
    :ref_orgs_with_responsibles_count, :ref_planning_economy_value

  # All significant fields in one array
  def self.significant_fields
    [:organizations, :organizations_audit_required, :buildings,
     :organizations_before, :buildings_before, :organizations_audited,
     :buildings_audited, :organizations_audited_percentage, :buildings_audited_percentage,
     :contracts_count_before, :contracts_count, :contracts_volume]
  end

  def organizations_audited_percentage
    return nil if organizations_audit_required.nil? or organizations_audit_required.zero?
    return 100*(organizations_before + organizations_audited).to_f / organizations_audit_required
  end

  def buildings_audited_percentage
    return nil if buildings.nil? or buildings.zero?
    return 100 * (buildings_before + buildings_audited).to_f / buildings
  end

  def reference_filled?
    ref_orgs_with_programs_count or ref_orgs_with_responsibles_count or ref_planning_economy_value
  end

  # Validator
  def audit_constraints
    # organizations_audit_required
    errors.add(:organizations_audit_required, :too_big) unless (organizations_audit_required <= organizations)
    # organizations_before
    errors.add(:organizations_before, :too_big) unless (organizations_before <= organizations_audit_required)
    # buildings_before
    errors.add(:buildings_before, :too_big) unless (buildings_before <= buildings)
    # organizations_audited
    errors.add(:organizations_audited, :too_big) unless (organizations_audited <= organizations_audit_required)
    # buildings_audited
    errors.add(:buildings_audited, :too_big) unless (buildings_audited <= buildings)
  end

end

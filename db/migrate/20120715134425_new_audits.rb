class NewAudits < ActiveRecord::Migration
  def up
    remove_column :audits, :audit_required
    add_column    :audits, :organizations, :integer, :default => 0
    add_column    :audits, :organizations_audit_required, :integer, :default => 0
    # :buildings column is left unchanged
    add_column    :audits, :organizations_before, :integer, :default => 0
    rename_column :audits, :audited_before, :buildings_before
    add_column    :audits, :organizations_audited, :integer, :default => 0
    rename_column :audits, :audited_in_period, :buildings_audited
    rename_column :audits, :audit_contracts_before, :contracts_count_before
    rename_column :audits, :audit_contracts_after,  :contracts_count
    add_column    :audits, :contracts_volume, :decimal, :default => 0, :precision => 32, :scale => 8
    # Reference info
    add_column    :audits, :ref_orgs_with_programs_count, :integer
    add_column    :audits, :ref_orgs_with_responsibles_count, :integer
    add_column    :audits, :ref_planning_economy_value, :integer
  end

  def down
    # Reference info
    remove_column :audits, :ref_planning_economy_value
    remove_column :audits, :ref_orgs_with_responsibles_count
    remove_column :audits, :ref_orgs_with_programs_count
    # Audits
    remove_column :audits, :contracts_volume
    rename_column :audits, :contracts_count, :audit_contracts_after
    rename_column :audits, :contracts_count_before, :audit_contracts_before
    rename_column :audits, :buildings_audited, :audited_in_period
    remove_column :audits, :organizations_audited
    rename_column :audits, :buildings_before, :audited_before
    remove_column :audits, :organizations_before
    # :buildings column is left unchanged
    remove_column :audits, :organizations_audit_required
    remove_column :audits, :organizations
    add_column    :audits, :audit_required, :integer, :default => 0
  end
end

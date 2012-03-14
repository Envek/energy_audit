class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.references :period, :null => false
      t.references :subject, :null => false
      t.integer :buildings, :default => 0
      t.integer :audited_before, :default => 0
      t.integer :audit_required, :default => 0
      t.integer :audited_in_period, :default => 0
      t.integer :audit_contracts_before, :default => 0
      t.integer :audit_contracts_after, :default => 0

      t.timestamps
    end
    add_index :audits, :period_id
    add_index :audits, :subject_id
    add_index :audits, [:period_id, :subject_id], :unique => true, :order => {:period_id => :desc}, :name => :audits_main_index
  end
end

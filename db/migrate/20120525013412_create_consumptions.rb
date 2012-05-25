class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.references :period, :null => false
      t.references :subject, :null => false
      t.references :resource, :null => false
      t.decimal :prev_cons_units, :default => 0, :precision => 32, :scale => 8
      t.decimal :prev_cons_monetary, :default => 0, :precision => 32, :scale => 8
      t.decimal :approved_year_cons_units, :default => 0, :precision => 32, :scale => 8
      t.decimal :approved_year_cons_monetary, :default => 0, :precision => 32, :scale => 8
      t.decimal :approved_period_cons_units, :default => 0, :precision => 32, :scale => 8
      t.decimal :approved_period_cons_monetary, :default => 0, :precision => 32, :scale => 8
      t.decimal :actual_cons_units, :default => 0, :precision => 32, :scale => 8
      t.decimal :actual_cons_monetary, :default => 0, :precision => 32, :scale => 8
      t.string :reason
      t.timestamps
    end
    add_index :consumptions, :period_id
    add_index :consumptions, :subject_id
    add_index :consumptions, :resource_id
    add_index :consumptions, [:period_id, :subject_id, :resource_id], :unique => true, :order => {:period_id => :desc}, :name => :consumptions_main_index
  end
end

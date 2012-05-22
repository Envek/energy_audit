class CreateActivityValues < ActiveRecord::Migration
  def change
    create_table :activity_values do |t|
      t.references :period, :null => false
      t.references :subject, :null => false
      t.references :activity, :null => false
      t.decimal :planned_funding, :default => 0, :precision => 32, :scale => 8
      t.decimal :actual_funding, :default => 0, :precision => 32, :scale => 8
      t.decimal :total_financing, :default => 0, :precision => 32, :scale => 8
      t.decimal :regional_financing, :default => 0, :precision => 32, :scale => 8
      t.decimal :federal_financing, :default => 0, :precision => 32, :scale => 8
      t.decimal :municipal_financing, :default => 0, :precision => 32, :scale => 8
      t.decimal :offbudget_financing, :default => 0, :precision => 32, :scale => 8
      t.decimal :natural_economy, :default => 0, :precision => 32, :scale => 8
      t.decimal :cost_economy, :default => 0, :precision => 32, :scale => 8

      t.timestamps
    end
    add_index :activity_values, :period_id
    add_index :activity_values, :subject_id
    add_index :activity_values, :activity_id
    add_index :activity_values, [:period_id, :subject_id, :activity_id], :unique => true, :order => {:period_id => :desc}, :name => :activity_values_main_index
  end
end

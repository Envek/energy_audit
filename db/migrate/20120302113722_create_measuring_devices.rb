class CreateMeasuringDevices < ActiveRecord::Migration
  def change
    create_table :measuring_devices do |t|
      t.references :period, :null => false
      t.references :subject, :null => false
      t.references :area, :null => false
      t.references :kind, :null => false
      t.decimal :start_value, :default => 0, :precision => 32, :scale => 8
      t.decimal :planned_value, :default => 0, :precision => 32, :scale => 8
      t.decimal :final_value, :default => 0, :precision => 32, :scale => 8

      t.timestamps
    end
    add_index :measuring_devices, :period_id
    add_index :measuring_devices, :subject_id
    add_index :measuring_devices, :area_id
    add_index :measuring_devices, :kind_id
    add_index :measuring_devices, [:period_id, :subject_id, :area_id, :kind_id], :unique => true, :order => {:period_id => :desc}, :name => :measuring_devices_main_index
  end
end

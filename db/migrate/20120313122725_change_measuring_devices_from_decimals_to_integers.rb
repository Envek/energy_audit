class ChangeMeasuringDevicesFromDecimalsToIntegers < ActiveRecord::Migration
  def up
    change_table :measuring_devices do |t|
      t.change :start_value, :integer
      t.change :planned_value, :integer
      t.change :final_value, :integer
    end
    say "Value columns were converted to integer type.", :indent_this_message
    say "Some data loss could be done due to truncating!", :indent_this_message
  end
  
  def down
    change_table :measuring_devices do |t|
      t.change :start_value, :decimal, :default => 0, :precision => 32, :scale => 8
      t.change :planned_value, :decimal, :default => 0, :precision => 32, :scale => 8
      t.change :final_value, :decimal, :default => 0, :precision => 32, :scale => 8
    end
  end
end

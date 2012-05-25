class AddUnitsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :unit, :string, :default => ''
  end
end

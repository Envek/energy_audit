class CreateProductionResources < ActiveRecord::Migration
  def change
    create_table :production_resources do |t|
      t.string :name, :null => false
      t.string :unit, :null => false

      t.timestamps
    end
    add_index :production_resources, :name, :unique => true
  end
end

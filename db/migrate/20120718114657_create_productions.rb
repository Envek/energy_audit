class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.references :period
      t.references :subject
      t.references :production_resource
      t.decimal :production, :precision => 32, :scale => 8, :null => false
      t.decimal :consumption, :precision => 32, :scale => 8, :null => false
      t.decimal :useful_output, :precision => 32, :scale => 8, :null => false

      t.timestamps
    end
    add_index :productions, :period_id
    add_index :productions, :subject_id
    add_index :productions, :production_resource_id
    add_index :productions, [:period_id, :subject_id, :production_resource_id], :unique => true, :name => :productions_main_index
  end
end

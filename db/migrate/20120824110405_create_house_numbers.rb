class CreateHouseNumbers < ActiveRecord::Migration
  def change
    create_table :house_numbers do |t|
      t.references :period
      t.references :subject
      t.references :house_type
      t.integer :total, :null => false
      t.integer :required, :null => false
      t.integer :equipped, :null => false
      t.timestamps
    end
    add_index :house_numbers, :period_id
    add_index :house_numbers, :subject_id
    add_index :house_numbers, :house_type_id
    add_index :house_numbers, [:period_id, :subject_id, :house_type_id], :unique => true, :name => :house_numbers_main_index
  end
end

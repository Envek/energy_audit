class CreateHouseKindNumbers < ActiveRecord::Migration
  def change
    create_table :house_kind_numbers do |t|
      t.references :house_number
      t.references :house_kind
      t.integer :required, :null => false
      t.integer :equipped, :null => false
      t.timestamps
    end
    add_index :house_kind_numbers, :house_number_id
    add_index :house_kind_numbers, :house_kind_id
    add_index :house_kind_numbers, [:house_number_id, :house_kind_id], :unique => true, :name => :house_kind_numbers_main_index
  end
end

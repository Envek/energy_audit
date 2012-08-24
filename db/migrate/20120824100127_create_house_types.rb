class CreateHouseTypes < ActiveRecord::Migration
  def change
    create_table :house_types do |t|
      t.string :name, :null => false
      t.timestamps
    end
    add_index :house_types, :name, :unique => true
  end
end

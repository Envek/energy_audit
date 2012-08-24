class CreateHouseKinds < ActiveRecord::Migration
  def change
    create_table :house_kinds do |t|
      t.string :name, :null => false
      t.timestamps
    end
    add_index :house_kinds, :name, :unique => true
  end
end

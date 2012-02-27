class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :kinds, :name, :unique => true
  end
end

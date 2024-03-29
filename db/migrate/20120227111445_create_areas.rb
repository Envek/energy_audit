class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :areas, :name, :unique => true
  end
end
